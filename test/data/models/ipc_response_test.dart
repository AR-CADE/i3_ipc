import 'package:i3_ipc/data/models/ipc_response.dart';
import 'package:test/test.dart';

void main() {
  group('IPCResponse model', () {
    group('serialize', () {
      test('with required parameters only', () {
        final ipcResponse = IPCResponse();
        final json = ipcResponse.toJSON();
        final type = json['type'];
        final size = json['size'];
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
          processId: 'pid_test',
          payload: 'payload_test',
        );
        final json = ipcResponse.toJSON();
        final type = json['type'];
        final size = json['size'];
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
          ..pid = 'pid_test'
          ..payload = 'payload_test';
        final json = ipcResponse.toJSON();
        final type = json['type'];
        final size = json['size'];
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
        final iPCResponse = IPCResponse.fromJSON(json);
        expect(
          iPCResponse.type,
          1,
        );
        expect(
          iPCResponse.size,
          1,
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

      test('with required all parameters', () {
        final json = {
          'type': 1,
          'size': 1,
          'pid': 'pid_test',
          'payload': 'payload_test',
        };
        final iPCResponse = IPCResponse.fromJSON(json);
        expect(
          iPCResponse.type,
          1,
        );
        expect(
          iPCResponse.size,
          1,
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
  });
}
