import 'dart:async';
import 'dart:io';

import 'dart:typed_data';

import 'package:i3_ipc/api/socket_api.dart';
import 'package:i3_ipc/core/tools/ipc_payload_type.dart';
import 'package:i3_ipc/core/tools/ipc_response_parsers.dart';
import 'package:i3_ipc/data/models/ipc_response.dart';
import 'package:i3_ipc/data/repositories/ipc_command/ipc_command_repository.dart';
import 'package:test/test.dart';

import '../../../core/test.dart';

class _MockI3IpcClientApi extends MockI3IpcClientApi {
  @override
  void execute(
    int type, {
    required String pid,
    String payload = '',
    StreamController<IPCResponse?>? controller,
    Endian? endian,
    String? socketPath,
    Duration timeout = const Duration(seconds: 2),
    I3IpcSocketApi socket = const I3IpcSocketApi(),
  }) {
    final file = File('test/data/json/get_binding_state.json');
    controller?.add(
      IPCResponse(
        type: IpcPayloadType.ipcGetBindingState,
        payload: file.readAsStringSync(),
      ),
    );
  }
}

void main() {
  group('I3IpcCommandRepository', () {
    late I3IpcCommandRepository i3IpcCommandRepository;
    late _MockI3IpcClientApi client;

    setUp(() {
      i3IpcCommandRepository = I3IpcCommandRepository();
      client = _MockI3IpcClientApi();
    });

    test('onGetBindingState', () async {
      unawaited(
        i3IpcCommandRepository.stream.first.then((response) {
          expect(
            response != null,
            true,
          );

          expect(
            response?.payload != null,
            true,
          );

          final state = parseBindingState(response);

          expect(
            state != null,
            true,
          );

          expect(
            state!.name,
            'default',
          );
        }),
      );
      await i3IpcCommandRepository.getBindingState(
        client: client,
      );

      i3IpcCommandRepository.close();
    });
  });
}
