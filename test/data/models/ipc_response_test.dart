import 'dart:convert';

import 'package:i3_ipc/data/models/ipc_response.dart';
import 'package:test/test.dart';

void main() {
  group('IPCResponse model', () {
    group('serialize', () {
      test('with required parameters only', () {
        final ipcResponse = IPCResponse();
        final json = ipcResponse.toJson();
        final type = json['type'];
        final size = json['size'];
        final id = json['id'];
        final pid = json['pid'];
        final payload = json['payload'];
        expect(
          type,
          -1,
        );
        expect(
          size,
          0,
        );
        expect(
          id,
          null,
        );
        expect(
          pid,
          null,
        );
        expect(
          payload,
          null,
        );
      });

      test('with all parameters', () {
        final ipcResponse = IPCResponse(
          type: 1,
          size: 1,
          id: 'id_test',
          pid: 'pid_test',
          payload: 'payload_test',
        );
        final json = ipcResponse.toJson();
        final type = json['type'];
        final size = json['size'];
        final id = json['id'];
        final pid = json['pid'];
        final payload = json['payload'];
        expect(
          type,
          1,
        );
        expect(
          size,
          1,
        );
        expect(
          id,
          'id_test',
        );
        expect(
          pid,
          'pid_test',
        );
        expect(
          payload,
          'payload_test',
        );
      });

      test('with all properties', () {
        final ipcResponse = IPCResponse()
          ..type = 1
          ..size = 1
          ..id = 'id_test'
          ..pid = 'pid_test'
          ..payload = 'payload_test';
        final json = ipcResponse.toJson();
        final type = json['type'];
        final size = json['size'];
        final id = json['id'];
        final pid = json['pid'];
        final payload = json['payload'];
        expect(
          type,
          1,
        );
        expect(
          size,
          1,
        );
        expect(
          id,
          'id_test',
        );
        expect(
          pid,
          'pid_test',
        );
        expect(
          payload,
          'payload_test',
        );
      });
    });

    group('deserialize', () {
      test('with required parameters only', () {
        final json = {'type': 1, 'size': 1};
        final iPCResponse = IPCResponse.fromJson(json);

        expect(
          json,
          iPCResponse.toJson(),
        );

        expect(
          iPCResponse.type,
          1,
        );
        expect(
          iPCResponse.size,
          1,
        );
        expect(
          iPCResponse.id,
          null,
        );
        expect(
          iPCResponse.pid,
          null,
        );
        expect(
          iPCResponse.payload,
          null,
        );
      });

      test('with all parameters', () {
        final json = {
          'type': 1,
          'size': 1,
          'id': 'id_test',
          'pid': 'pid_test',
          'payload': 'payload_test',
        };
        final iPCResponse = IPCResponse.fromJson(json);

        expect(
          json,
          iPCResponse.toJson(),
        );

        expect(
          iPCResponse.type,
          1,
        );
        expect(
          iPCResponse.size,
          1,
        );
        expect(
          iPCResponse.id,
          'id_test',
        );
        expect(
          iPCResponse.pid,
          'pid_test',
        );
        expect(
          iPCResponse.payload,
          'payload_test',
        );
      });
    });

    group('to string', () {
      test('with required parameters only', () {
        final json = {'type': 1, 'size': 1};

        final expectedJson = {
          'type': 1,
          'size': 1,
        };
        final iPCResponse = IPCResponse.fromJson(json);

        expect(
          json,
          iPCResponse.toJson(),
        );
        final string = iPCResponse.toString();
        expect(
          string,
          jsonEncode(expectedJson),
        );
      });

      test('with all parameters', () {
        final json = {
          'type': 1,
          'size': 1,
          'payload': 'payload_test',
          'id': 'id_test',
          'pid': 'pid_test',
        };
        final iPCResponse = IPCResponse.fromJson(json);

        expect(
          json,
          iPCResponse.toJson(),
        );
        final string = iPCResponse.toString();
        expect(
          string,
          jsonEncode(json),
        );
      });
    });
  });
}
