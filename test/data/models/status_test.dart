import 'package:i3_ipc/data/models/status.dart';
import 'package:test/test.dart';

void main() {
  group('Status model', () {
    test('props are correct', () {
      const status =
          Status(success: true, parseError: false, error: 'error_test');

      expect(
        status.props,
        equals([true, false, 'error_test']),
      );
    });

    test('equality', () {
      expect(
        const Status(success: true, parseError: false, error: 'error_test'),
        const Status(success: true, parseError: false, error: 'error_test'),
      );
    });

    group('serialize', () {
      test('with required parameters only', () {
        const status = Status();
        final json = status.toJson();
        final success = json['success'];
        final parseError = json['parse_error'];
        final error = json['error'];

        expect(
          success,
          true,
        );

        expect(
          parseError,
          null,
        );

        expect(
          error,
          null,
        );
      });

      test('with all parameters', () {
        const status =
            Status(success: true, parseError: false, error: 'error_test');
        final json = status.toJson();
        final success = json['success'];
        final parseError = json['parse_error'];
        final error = json['error'];

        expect(
          success,
          true,
        );

        expect(
          parseError,
          false,
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
        final Map<String, dynamic> json = {};
        final status = Status.fromJson(json);
        expect(
          {'success': true},
          status.toJson(),
        );
        expect(
          status.success,
          true,
        );

        expect(
          status.parseError,
          null,
        );

        expect(
          status.error,
          null,
        );
      });

      test('with all parameters', () {
        final json = {
          'success': true,
          'parse_error': false,
          'error': 'error_test',
        };
        final status = Status.fromJson(json);
        expect(
          json,
          status.toJson(),
        );

        expect(
          status.success,
          true,
        );

        expect(
          status.parseError,
          false,
        );

        expect(
          status.error,
          'error_test',
        );
      });
    });
  });
}
