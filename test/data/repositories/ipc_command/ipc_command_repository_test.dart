import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:i3_ipc/api/socket_api.dart';
import 'package:i3_ipc/core/tools/ipc_payload_type.dart';
import 'package:i3_ipc/data/models/ipc_response.dart';
import 'package:i3_ipc/data/models/status.dart';
import 'package:i3_ipc/data/repositories/ipc_command/ipc_command_repository.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

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
    if (type == IpcPayloadType.ipcSubscribe) {
      controller?.add(
        IPCResponse(
          pid: pid,
          payload: jsonEncode(const Status(success: true).toJson()),
        ),
      );

      final stream = [
        IPCResponse(id: const Uuid().v4(), pid: pid),
        IPCResponse(id: const Uuid().v4(), pid: pid),
        IPCResponse(id: const Uuid().v4(), pid: pid),
        IPCResponse(id: const Uuid().v4(), pid: pid),
        IPCResponse(id: const Uuid().v4(), pid: pid),
      ];

      for (final response in stream) {
        controller?.add(response);
      }
    } else {
      controller?.add(const IPCResponse());
    }
  }
}

class _MockI3IpcClientFailedApi extends MockI3IpcClientApi {
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
    if (type == IpcPayloadType.ipcSubscribe) {
      controller?.add(
        IPCResponse(
          pid: pid,
          payload: jsonEncode(const Status(success: false).toJson()),
        ),
      );
    } else {
      controller?.add(null);
    }
  }
}

class _MockI3IpcClientErrorApi extends MockI3IpcClientApi {
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
    return controller?.addError('Error in proccess with $pid');
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
            i3IpcCommandRepository.isClosed,
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
          i3IpcCommandRepository.close();
          expect(
            i3IpcCommandRepository.processCount,
            0,
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
        final response = await i3IpcCommandRepository.stream.first;
        i3IpcCommandRepository.close(pid: response?.pid);
      });

      test('failed', () async {
        final client = _MockI3IpcClientFailedApi();

        try {
          await i3IpcCommandRepository.subscribeEvents(
            payload: '["window"]',
            client: client,
          );
        } on Exception catch (_) {
          return;
        }

        final response = await i3IpcCommandRepository.stream.first;
        i3IpcCommandRepository.close(pid: response?.pid);

        throw Exception('Expected Exception');
      });

      test('error', () async {
        final client = _MockI3IpcClientErrorApi();

        try {
          await i3IpcCommandRepository.subscribeEvents(
            payload: '["window"]',
            client: client,
          );
        } on Exception catch (_) {
          expect(
            i3IpcCommandRepository.processCount,
            0,
          );
          return;
        }

        final response = await i3IpcCommandRepository.stream.first;
        i3IpcCommandRepository.close(pid: response?.pid);

        throw Exception('Expected Exception');
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

      test('error', () async {
        final client = _MockI3IpcClientErrorApi();

        try {
          await i3IpcCommandRepository.execute(
            0,
            client: client,
          );
        } on Exception catch (_) {
          expect(
            i3IpcCommandRepository.processCount,
            0,
          );
          return;
        }

        final response = await i3IpcCommandRepository.stream.first;
        i3IpcCommandRepository.close(pid: response?.pid);

        throw Exception('Expected Exception');
      });
    });
  });
}
