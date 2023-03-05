import 'dart:async';
import 'dart:io';

import 'package:i3_ipc/i3_ipc.dart';

void main() {
  //
  // The most simple way to execute a get_tree
  //
  print('Executing a get_tree single command:');
  I3SingleCommand.getTree().then((value) {
    print('result: $value');
  });

  //
  // A more complex way to execute a get_tree
  //
  print('Executing a get_tree single command in a more complex way:');
  final controller = StreamController<IPCResponse?>();

  IPCClient.singleCommand(IPCPayloadType.ipcGetTree, controller: controller);

  final response = controller.stream.first.then((status) {
    print('status: $status');
    controller.close();
    return status;
  });
  response.then((value) => print('result: $value'));

  //
  // Executing a 'window' subscription
  //
  final StreamController<IPCResponse?> windowStreamController =
      StreamController<IPCResponse?>.broadcast();
  IPCClient.singleCommand(IPCPayloadType.ipcSubscribe,
      payload: '["window"]', controller: windowStreamController);
  final stream = windowStreamController.stream.asBroadcastStream();

  stream.first.then((status) {
    print('status: $status');
    stream.listen((event) {
      print(event);
    });
  });

  //
  // Don't forget to close the stream controller when the program exit as follow,
  // or you use the on_exit package (https://pub.dev/packages/on_exit)
  //
  final signals = [ProcessSignal.sigint];
  if (!Platform.isWindows) {
    signals.add(ProcessSignal.sigterm);
  }

  for (var signal in signals) {
    signal.watch().listen((signal) async {
      windowStreamController.close();
      exit(0);
    });
  }
}
