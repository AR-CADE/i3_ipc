import 'dart:async';
import 'dart:convert';

import 'dart:typed_data';

import 'package:i3_ipc/api/socket_api.dart';
import 'package:i3_ipc/core/tools/ipc_payload_type.dart';
import 'package:i3_ipc/core/tools/ipc_response_parsers.dart';
import 'package:i3_ipc/data/models/ipc_response.dart';
import 'package:i3_ipc/data/models/status.dart';
import 'package:i3_ipc/data/repositories/ipc_command/ipc_command_repository.dart';
import 'package:test/test.dart';

import '../../../core/test.dart';

class _MockI3IpcClientApi extends MockI3IpcClientApi {
  @override
  Future<void> execute(
    int type, {
    required String pid,
    String payload = '',
    StreamController<IPCResponse?>? controller,
    Endian? endian,
    String? socketPath,
    Duration timeout = const Duration(seconds: 2),
    I3IpcSocketApi socket = const I3IpcSocketApi(),
  }) async {
    return controller?.add(
      IPCResponse(
        type: IpcPayloadType.ipcSync,
        payload: jsonEncode(const Status(success: true).toJson()),
      ),
    );
  }
}

void main() {
  group('I3IpcCommandRepository', () {
    late I3IpcCommandRepository i3IpcCommandRepository;
    late _MockI3IpcClientApi client;
    late MockI3IpcClientNullResponseApi nullResponseClient;

    setUp(() {
      i3IpcCommandRepository = I3IpcCommandRepository();
      client = _MockI3IpcClientApi();
      nullResponseClient = MockI3IpcClientNullResponseApi();
    });

    group('onSync', () {
      test('with success', () async {
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

            final status = parseStatus(response);

            expect(
              status != null,
              true,
            );

            expect(
              status!.success,
              true,
            );
          }),
        );
        await i3IpcCommandRepository.sync(
          client: client,
        );

        i3IpcCommandRepository.close();
      });

      test('with error', () async {
        unawaited(
          i3IpcCommandRepository.stream.first.then((response) {
            expect(
              response == null,
              true,
            );

            final status = parseStatus(response);

            expect(
              status == null,
              true,
            );
          }),
        );
        await i3IpcCommandRepository.sync(
          client: nullResponseClient,
        );

        i3IpcCommandRepository.close();
      });
    });
  });
}
