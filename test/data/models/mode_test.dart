import 'package:i3_ipc/data/models/mode.dart';
import 'package:test/test.dart';

void main() {
  group('Mode model', () {
    group('serialize', () {
      test('with required parameters only', () {
        const mode = Mode(width: 1, height: 2, refresh: 3);
        final json = mode.toJson();
        final width = json['width'];
        final height = json['height'];
        final refresh = json['refresh'];
        final modePictureAspectRatio = json['picture_aspect_ratio'];

        expect(
          width,
          1,
        );
        expect(
          height,
          2,
        );
        expect(
          refresh,
          3,
        );
        expect(
          modePictureAspectRatio,
          null,
        );
      });

      test('with all parameters', () {
        const mode = Mode(
          width: 1,
          height: 2,
          refresh: 3,
          modePictureAspectRatio: 'modePictureAspectRatio_test',
        );
        final json = mode.toJson();
        final width = json['width'];
        final height = json['height'];
        final refresh = json['refresh'];
        final modePictureAspectRatio = json['picture_aspect_ratio'];

        expect(
          width,
          1,
        );
        expect(
          height,
          2,
        );
        expect(
          refresh,
          3,
        );
        expect(
          modePictureAspectRatio,
          'modePictureAspectRatio_test',
        );
      });
    });

    group('deserialize', () {
      test('with required parameters only', () {
        final json = {'width': 1, 'height': 2, 'refresh': 3};
        final mode = Mode.fromJson(json);
        expect(
          json,
          mode.toJson(),
        );
        expect(
          mode.width,
          1,
        );
        expect(
          mode.height,
          2,
        );
        expect(
          mode.refresh,
          3,
        );
        expect(
          mode.modePictureAspectRatio,
          null,
        );
      });

      test('with all parameters', () {
        final json = {
          'width': 1,
          'height': 2,
          'refresh': 3,
          'picture_aspect_ratio': 'modePictureAspectRatio_test',
        };
        final mode = Mode.fromJson(json);
        expect(
          json,
          mode.toJson(),
        );
        expect(
          mode.width,
          1,
        );
        expect(
          mode.height,
          2,
        );
        expect(
          mode.refresh,
          3,
        );
        expect(
          mode.modePictureAspectRatio,
          'modePictureAspectRatio_test',
        );
      });
    });
  });
}
