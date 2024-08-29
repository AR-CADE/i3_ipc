import 'package:i3_ipc/data/models/rect.dart';
import 'package:test/test.dart';

void main() {
  group('Rect model', () {
    test('serialize', () {
      const mode = Rect(
        x: 1,
        y: 2,
        width: 3,
        height: 4,
      );
      final json = mode.toJson();
      final x = json['x'];
      final y = json['y'];
      final width = json['width'];
      final height = json['height'];

      expect(
        x,
        1,
      );
      expect(
        y,
        2,
      );
      expect(
        width,
        3,
      );
      expect(
        height,
        4,
      );
    });

    test('deserialize', () {
      final json = {'x': 1, 'y': 2, 'width': 3, 'height': 4};
      final rect = Rect.fromJson(json);
      expect(
        json,
        rect.toJson(),
      );
      expect(
        rect.x,
        1,
      );
      expect(
        rect.y,
        2,
      );
      expect(
        rect.width,
        3,
      );
      expect(
        rect.height,
        4,
      );
    });
  });
}
