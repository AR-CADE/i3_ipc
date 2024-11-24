import 'package:i3_ipc/data/models/seat.dart';
import 'package:test/test.dart';

import '../../core/test.dart';

class _MockInput extends MockInput {
  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['identifier'] = 'identifier_test';
    data['name'] = 'name_test';
    data['vendor'] = 1;
    data['product'] = 2;
    data['type'] = 'type_test';
    data['xkb_active_layout_name'] = 'xkbActiveLayoutName_test';
    data['xkb_layout_names'] = ['1', '2'];
    data['xkb_active_layout_index'] = 3;
    data['repeat_delay'] = 4;
    data['repeat_rate'] = 5;
    return data;
  }
}

void main() {
  group('Seat model', () {
    test('props are correct', () {
      final devicesMock = [_MockInput(), _MockInput()];
      final seat = Seat(
        name: 'name_test',
        capabilities: 1,
        focus: 2,
        devices: devicesMock,
      );
      expect(
        seat.props,
        equals(['name_test']),
      );
    });

    test('serialize', () {
      final devicesMock = [_MockInput(), _MockInput()];
      final seat = Seat(
        name: 'name_test',
        capabilities: 1,
        focus: 2,
        devices: devicesMock,
      );
      final json = seat.toJson();
      final name = json['name'];
      final capabilities = json['capabilities'];
      final focus = json['focus'];
      final devices = json['devices'];

      expect(
        name,
        'name_test',
      );
      expect(
        capabilities,
        1,
      );
      expect(
        focus,
        2,
      );
      expect(
        devices,
        devicesMock.map((e) => e.toJson()),
      );
    });

    test('deserialize', () {
      final devicesMock = [_MockInput(), _MockInput()];

      final json = {
        'name': 'name_test',
        'capabilities': 1,
        'focus': 2,
        'devices': devicesMock.map((e) => e.toJson()).toList(),
      };
      final seat = Seat.fromJson(json);
      expect(
        json,
        seat.toJson(),
      );
      expect(
        seat.name,
        'name_test',
      );
      expect(
        seat.capabilities,
        1,
      );
      expect(
        seat.focus,
        2,
      );
      expect(
        seat.devices.map((e) => e.toJson()),
        devicesMock.map((e) => e.toJson()),
      );
    });
  });
}
