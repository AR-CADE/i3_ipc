import 'package:i3_ipc/data/models/binding_state.dart';
import 'package:test/test.dart';

void main() {
  group('BindingState model', () {
    test('props are correct', () {
      const bindingState = BindingState(name: 'name_test');
      expect(
        bindingState.props,
        equals(['name_test']),
      );
    });

    test('equality', () {
      expect(
        const BindingState(name: 'name_test'),
        const BindingState(name: 'name_test'),
      );
    });

    test('serialize', () {
      const bindingState = BindingState(name: 'name_test');
      final value = bindingState.toJson()['name'];

      expect(
        value,
        'name_test',
      );
    });

    test('deserialize', () {
      final json = {'name': 'name_test'};
      final state = BindingState.fromJson(json);

      expect(
        json,
        state.toJson(),
      );

      expect(
        state.name,
        'name_test',
      );
    });
  });
}
