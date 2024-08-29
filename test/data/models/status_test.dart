import 'package:i3_ipc/data/models/status.dart';
import 'package:test/test.dart';

void main() {
  group('Status model', () {
    group('serialize', () {
      test('with required parameters only', () {
        const status = Status();
        final json = status.toJSON();
        final success = json['success'];
        final error = json['error'];

        expect(
          success,
          true,
        );

        expect(
          error,
          null,
        );
      });

      test('with all parameters', () {
        const status = Status(success: true, error: 'error_test');
        final json = status.toJSON();
        final success = json['success'];
        final error = json['error'];

        expect(
          success,
          true,
        );

        expect(
          error,
          'error_test',
        );
      });
    });

    group('deserialize', () {
      test('with required parameters only', () {
        // ignore: omit_local_variable_types
        final Map<String, Object?> json = {};
        final status = Status.fromJSON(json);
        expect(
          {'success': true},
          status.toJSON(),
        );
        expect(
          status.success,
          true,
        );

        expect(
          status.error,
          null,
        );
      });

      test('with all parameters', () {
        final json = {'success': true, 'error': 'error_test'};
        final status = Status.fromJSON(json);
        expect(
          json,
          status.toJSON(),
        );
        expect(
          status.success,
          true,
        );

        expect(
          status.error,
          'error_test',
        );
      });
    });
  });
}
