import 'package:i3_ipc/data/models/version.dart';
import 'package:test/test.dart';

void main() {
  group('Version model', () {
    test('props are correct', () {
      const version = Version(
        humanReadable: 'humanReadable_test',
        major: 1,
        minor: 2,
        patch: 3,
        loadedConfigFileName: 'loadedConfigFileName_test',
        variant: 'variant_test',
      );
      expect(
        version.props,
        equals([
          1,
          2,
          3,
          'humanReadable_test',
          'loadedConfigFileName_test',
          'variant_test',
        ]),
      );
    });

    test('equality', () {
      expect(
        const Version(
          humanReadable: 'humanReadable_test',
          major: 1,
          minor: 2,
          patch: 3,
          loadedConfigFileName: 'loadedConfigFileName_test',
          variant: 'variant_test',
        ),
        const Version(
          humanReadable: 'humanReadable_test',
          major: 1,
          minor: 2,
          patch: 3,
          loadedConfigFileName: 'loadedConfigFileName_test',
          variant: 'variant_test',
        ),
      );
    });

    test('serialize', () {
      const version = Version(
        humanReadable: 'humanReadable_test',
        major: 1,
        minor: 2,
        patch: 3,
        loadedConfigFileName: 'loadedConfigFileName_test',
        variant: 'variant_test',
      );
      final json = version.toJson();
      final humanReadable = json['human_readable'];
      final major = json['major'];
      final minor = json['minor'];
      final patch = json['patch'];
      final loadedConfigFileName = json['loaded_config_file_name'];
      final variant = json['variant'];

      expect(
        humanReadable,
        'humanReadable_test',
      );
      expect(
        variant,
        'variant_test',
      );
      expect(
        major,
        1,
      );
      expect(
        minor,
        2,
      );
      expect(
        patch,
        3,
      );
      expect(
        loadedConfigFileName,
        'loadedConfigFileName_test',
      );
    });

    test('deserialize', () {
      final json = {
        'human_readable': 'humanReadable_test',
        'major': 1,
        'minor': 2,
        'patch': 3,
        'loaded_config_file_name': 'loadedConfigFileName_test',
        'variant': 'variant_test',
      };
      final version = Version.fromJson(json);
      expect(
        json,
        version.toJson(),
      );
      expect(
        version.humanReadable,
        'humanReadable_test',
      );
      expect(
        version.variant,
        'variant_test',
      );
      expect(
        version.major,
        1,
      );
      expect(
        version.minor,
        2,
      );
      expect(
        version.patch,
        3,
      );
      expect(
        version.loadedConfigFileName,
        'loadedConfigFileName_test',
      );
    });
  });
}
