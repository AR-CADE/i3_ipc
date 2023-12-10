import 'dart:async';
import 'dart:io';

import 'package:i3_ipc/i3_ipc.dart';

void main() {
  final i3CommandRepository = I3IpcCommandRepository();
  final bloc = I3ClientBloc(i3CommandRepository: i3CommandRepository);
  StreamSubscription<I3ClientBlocState>? subscription;

  Future.microtask(() async {
    //
    // Execute a get_tree
    //
    stdout.write('Execute a `get_tree` command:\n');

    bloc.add(const I3IpcGetTreeRequested());

    final value = await bloc.stream.first;
    stdout
      ..write('result: ${value.response}\n')

      //
      // Execute a 'window' subscription
      //
      ..write('Execute a `window` subscription:\n');

    bloc.add(const I3IpcSubscribeEventsRequested(payload: '["window"]'));
    var i = 0;
    subscription = bloc.stream.listen((value) {
      stdout.write('\nresult ${++i}: ${value.response}\n');
    });
  });

  //
  // Don't forget to close the repository and the bloc when the program exit as
  // follow, or you use the on_exit package (https://pub.dev/packages/on_exit)
  //
  final signals = [ProcessSignal.sigint];
  if (!Platform.isWindows) {
    signals.add(ProcessSignal.sigterm);
  }

  for (final signal in signals) {
    signal.watch().listen((signal) async {
      await subscription?.cancel();
      await bloc.close();
      i3CommandRepository.close();
      exit(0);
    });
  }
}
