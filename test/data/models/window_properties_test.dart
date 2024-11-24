import 'package:i3_ipc/data/models/window_properties.dart';
import 'package:test/test.dart';

void main() {
  group('WindowProperties model', () {
    test('props are correct', () {
      const windowProperties = WindowProperties(
        clazz: 'class_test',
        instance: 'instance_test',
        title: 'title_test',
        transientFor: 'transientFor_test',
      );
      expect(
        windowProperties.props,
        equals(
          ['class_test', 'instance_test', 'title_test', 'transientFor_test'],
        ),
      );
    });

    test('equality', () {
      expect(
        const WindowProperties(
          clazz: 'class_test',
          instance: 'instance_test',
          title: 'title_test',
          transientFor: 'transientFor_test',
        ),
        const WindowProperties(
          clazz: 'class_test',
          instance: 'instance_test',
          title: 'title_test',
          transientFor: 'transientFor_test',
        ),
      );
    });

    group('serialize', () {
      test('with required parameters only', () {
        const windowProperties = WindowProperties(
          clazz: 'class_test',
          instance: 'instance_test',
          title: 'title_test',
        );
        final json = windowProperties.toJson();
        final clazz = json['class'];
        final instance = json['instance'];
        final title = json['title'];
        final transientFor = json['transient_for'];

        expect(
          clazz,
          'class_test',
        );
        expect(
          instance,
          'instance_test',
        );
        expect(
          title,
          'title_test',
        );
        expect(
          transientFor,
          null,
        );
      });

      test('with all parameters', () {
        const windowProperties = WindowProperties(
          clazz: 'class_test',
          instance: 'instance_test',
          title: 'title_test',
          transientFor: 'transientFor_test',
        );
        final json = windowProperties.toJson();
        final clazz = json['class'];
        final instance = json['instance'];
        final title = json['title'];
        final transientFor = json['transient_for'];

        expect(
          clazz,
          'class_test',
        );
        expect(
          instance,
          'instance_test',
        );
        expect(
          title,
          'title_test',
        );
        expect(
          transientFor,
          'transientFor_test',
        );
      });
    });

    group('deserialize', () {
      test('with required parameters only', () {
        final json = {
          'class': 'class_test',
          'instance': 'instance_test',
          'title': 'title_test',
        };
        final windowProperties = WindowProperties.fromJson(json);
        expect(
          json,
          windowProperties.toJson(),
        );
        expect(
          windowProperties.clazz,
          'class_test',
        );
        expect(
          windowProperties.instance,
          'instance_test',
        );
        expect(
          windowProperties.title,
          'title_test',
        );
        expect(
          windowProperties.transientFor,
          null,
        );
      });

      test('with all parameters', () {
        final json = {
          'class': 'class_test',
          'instance': 'instance_test',
          'title': 'title_test',
          'transient_for': 'transientFor_test',
        };
        final windowProperties = WindowProperties.fromJson(json);
        expect(
          json,
          windowProperties.toJson(),
        );
        expect(
          windowProperties.clazz,
          'class_test',
        );
        expect(
          windowProperties.instance,
          'instance_test',
        );
        expect(
          windowProperties.title,
          'title_test',
        );
        expect(
          windowProperties.transientFor,
          'transientFor_test',
        );
      });
    });
  });
}
