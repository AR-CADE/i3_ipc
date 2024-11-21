import 'package:i3_ipc/data/models/workspace.dart';
import 'package:test/test.dart';

import '../../core/test.dart';

class _MockRect extends MockRect {
  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['x'] = 0;
    data['y'] = 1;
    data['width'] = 2;
    data['height'] = 3;
    return data;
  }
}

void main() {
  group('Workspace model', () {
    test('props are correct', () {
      final rectMock = _MockRect();
      final workspace = Workspace(
        num: 1,
        name: 'name_test',
        visible: true,
        focused: true,
        urgent: false,
        rect: rectMock,
        output: 'output_test',
      );
      expect(
        workspace.props,
        equals([1, 'name_test']),
      );
    });

    group('serialize', () {
      test('with required parameters only', () {
        final rectMock = _MockRect();
        final workspace = Workspace(
          num: 1,
          name: 'name_test',
          visible: true,
          focused: true,
          urgent: false,
          rect: rectMock,
          output: 'output_test',
        );
        final json = workspace.toJson();
        final num = json['num'];
        final name = json['name'];
        final visible = json['visible'];
        final focused = json['focused'];
        final urgent = json['urgent'];
        final rect = json['rect'];
        final output = json['output'];
        final layout = json['layout'];
        final representation = json['representation'];

        expect(
          num,
          1,
        );
        expect(
          name,
          'name_test',
        );
        expect(
          visible,
          true,
        );
        expect(
          focused,
          true,
        );
        expect(
          urgent,
          false,
        );
        expect(
          rect,
          rectMock.toJson(),
        );
        expect(
          output,
          'output_test',
        );
        expect(
          layout,
          null,
        );
        expect(
          representation,
          null,
        );
      });

      test('with all parameters', () {
        final rectMock = _MockRect();
        final workspace = Workspace(
          num: 1,
          name: 'name_test',
          visible: true,
          focused: true,
          urgent: false,
          rect: rectMock,
          output: 'output_test',
          layout: 'layout_test',
          representation: 'representation_test',
        );
        final json = workspace.toJson();
        final num = json['num'];
        final name = json['name'];
        final visible = json['visible'];
        final focused = json['focused'];
        final urgent = json['urgent'];
        final rect = json['rect'];
        final output = json['output'];
        final layout = json['layout'];
        final representation = json['representation'];

        expect(
          num,
          1,
        );
        expect(
          name,
          'name_test',
        );
        expect(
          visible,
          true,
        );
        expect(
          focused,
          true,
        );
        expect(
          urgent,
          false,
        );
        expect(
          rect,
          rectMock.toJson(),
        );
        expect(
          output,
          'output_test',
        );
        expect(
          layout,
          'layout_test',
        );
        expect(
          representation,
          'representation_test',
        );
      });
    });

    group('deserialize', () {
      test('with required parameters only', () {
        final rectMock = _MockRect();
        final json = {
          'num': 1,
          'name': 'name_test',
          'visible': true,
          'focused': true,
          'urgent': false,
          'rect': rectMock.toJson(),
          'output': 'output_test',
        };
        final workspace = Workspace.fromJson(json);
        expect(
          json,
          workspace.toJson(),
        );
        expect(
          workspace.num,
          1,
        );
        expect(
          workspace.name,
          'name_test',
        );
        expect(
          workspace.visible,
          true,
        );
        expect(
          workspace.focused,
          true,
        );
        expect(
          workspace.urgent,
          false,
        );
        expect(
          workspace.rect.toJson(),
          rectMock.toJson(),
        );
        expect(
          workspace.output,
          'output_test',
        );
        expect(
          workspace.layout,
          null,
        );
        expect(
          workspace.representation,
          null,
        );
      });

      test('with all parameters', () {
        final rectMock = _MockRect();
        final json = {
          'num': 1,
          'name': 'name_test',
          'visible': true,
          'focused': true,
          'urgent': false,
          'rect': rectMock.toJson(),
          'output': 'output_test',
          'layout': 'layout_test',
          'representation': 'representation_test',
        };
        final workspace = Workspace.fromJson(json);
        expect(
          json,
          workspace.toJson(),
        );
        expect(
          workspace.num,
          1,
        );
        expect(
          workspace.name,
          'name_test',
        );
        expect(
          workspace.visible,
          true,
        );
        expect(
          workspace.focused,
          true,
        );
        expect(
          workspace.urgent,
          false,
        );
        expect(
          workspace.rect.toJson(),
          rectMock.toJson(),
        );
        expect(
          workspace.output,
          'output_test',
        );
        expect(
          workspace.layout,
          'layout_test',
        );
        expect(
          workspace.representation,
          'representation_test',
        );
      });
    });
  });
}
