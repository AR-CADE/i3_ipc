import 'package:i3_ipc/data/models/idle_inhibitor.dart';
import 'package:test/test.dart';

void main() {
  group('IdleInhibitor model', () {
    test('serialize', () {
      const idleInhibitor =
          IdleInhibitor(application: 'test_app', user: 'test_user');
      final json = idleInhibitor.toJson();

      final application = json['application'];
      final user = json['user'];

      expect(
        application,
        'test_app',
      );

      expect(
        user,
        'test_user',
      );
    });

    test('deserialize', () {
      final json = {'application': 'test_app', 'user': 'test_user'};
      final idleInhibitor = IdleInhibitor.fromJson(json);

      expect(
        json,
        idleInhibitor.toJson(),
      );

      expect(
        idleInhibitor.application,
        'test_app',
      );

      expect(
        idleInhibitor.user,
        'test_user',
      );
    });
  });
}
