import 'dart:async';
import 'dart:typed_data';

import 'package:i3_ipc/api/socket_api.dart';
import 'package:i3_ipc/core/tools/ipc_payload_type.dart';
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
    controller?.add(IPCResponse());
    if (type == IpcPayloadType.ipcSubscribe) {
      final stream = [IPCResponse(), IPCResponse(), IPCResponse()];

      for (final response in stream) {
        controller?.add(response);
      }
    }
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

    group('onInit', () {
      test('processCount == 0', () {
        expect(
          i3IpcCommandRepository.processCount,
          0,
        );
        i3IpcCommandRepository.close();
      });
    });

    group('onClose', () {
      group('with no running proccess', () {
        test('processCount == 0', () {
          i3IpcCommandRepository.close();
          expect(
            i3IpcCommandRepository.processCount,
            0,
          );
        });

        test('status is closed', () {
          i3IpcCommandRepository.close();
          expect(
            i3IpcCommandRepository.stream.isClosed,
            true,
          );
        });
      });

      group('with at least one running proccess', () {
        test('processCount == 0', () async {
          final client = _MockI3IpcClientApi();
          await i3IpcCommandRepository.subscribeEvents(
            payload: '["window"]',
            client: client,
          );
          expect(
            i3IpcCommandRepository.processCount,
            1,
          );

          Future.delayed(
            const Duration(milliseconds: 500),
            () {
              i3IpcCommandRepository.close();
              expect(
                i3IpcCommandRepository.processCount,
                0,
              );
            },
          );
        });
      });
    });

    group('onSubscribeEvents', () {
      test('processCount == 1', () async {
        final client = _MockI3IpcClientApi();
        await i3IpcCommandRepository.subscribeEvents(
          payload: '["window"]',
          client: client,
        );
        expect(
          i3IpcCommandRepository.processCount,
          1,
        );

        Future.delayed(
          const Duration(milliseconds: 500),
          () => i3IpcCommandRepository.close(),
        );
      });
    });

    group('onExecute', () {
      test('processCount == 0', () async {
        await i3IpcCommandRepository.execute(
          0,
          client: client,
        );
        expect(
          i3IpcCommandRepository.processCount,
          0,
        );

        i3IpcCommandRepository.close();
      });
    });
  });
}
