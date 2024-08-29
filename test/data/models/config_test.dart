import 'package:i3_ipc/data/models/config.dart';
import 'package:test/test.dart';

void main() {
  group('Config model', () {
    test('serialize', () {
      const config = Config(config: 'config_test');
      final value = config.toJSON()['config'];

      expect(
        value,
        'config_test',
      );
    });

    test('deserialize', () {
      final json = {'config': 'config_test'};
      final config = Config.fromJSON(json);

      expect(
        json,
        config.toJSON(),
      );

      expect(
        config.config,
        'config_test',
      );
    });
  });
}
