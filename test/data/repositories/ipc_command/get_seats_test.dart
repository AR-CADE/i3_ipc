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
    final file = File('test/data/json/get_seats.json');
    controller?.add(
      IPCResponse(
        type: IpcPayloadType.ipcGetSeats,
        payload: file.readAsStringSync(),
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

    group('onGetSeats', () {
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

            final seats = parseSeats(response);

            expect(
              seats.length,
              1,
            );

            expect(
              seats.first.name,
              'seat0',
            );
          }),
        );
        await i3IpcCommandRepository.getSeats(
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

            final seats = parseSeats(response);

            expect(
              seats.isEmpty,
              true,
            );
          }),
        );
        await i3IpcCommandRepository.getSeats(
          client: nullResponseClient,
        );

        i3IpcCommandRepository.close();
      });
    });
  });
}
