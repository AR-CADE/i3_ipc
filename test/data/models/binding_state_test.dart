import 'package:i3_ipc/data/models/binding_state.dart';
import 'package:test/test.dart';

void main() {
  group('BindingState model', () {
    test('serialize', () {
      const bindingState = BindingState(name: 'name_test');
      final value = bindingState.toJSON()['name'];

      expect(
        value,
        'name_test',
      );
    });

    test('deserialize', () {
      final json = {'name': 'name_test'};
      final state = BindingState.fromJSON(json);

      expect(
        json,
        state.toJSON(),
      );

      expect(
        state.name,
        'name_test',
      );
    });
  });
}
