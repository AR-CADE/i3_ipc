import 'package:i3_ipc/data/models/config.dart';
import 'package:test/test.dart';

void main() {
  group('Config model', () {
    test('serialize', () {
      const config = Config(config: 'config_test');
      final value = config.toJson()['config'];

      expect(
        value,
        'config_test',
      );
    });

    test('deserialize', () {
      final json = {'config': 'config_test'};
      final config = Config.fromJson(json);

      expect(
        json,
        config.toJson(),
      );

      expect(
        config.config,
        'config_test',
      );
    });
  });
}
