import 'package:i3_ipc/i3_ipc.dart';
import 'package:test/test.dart';

import '../../core/test.dart';

class _MockLibInput extends MockLibInput {
  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['send_events'] = 'sendEvents_test';
    data['tap'] = 'tap_test';
    data['tap_button_map'] = 'tapButtonMap_test';
    data['tap_drag'] = 'tapDrag_test';
    data['tap_drag_lock'] = 'tapDragLock_test';
    data['accel_speed'] = 1.2;
    data['accel_profile'] = 'accelProfile_test';
    data['natural_scroll'] = 'naturalScroll_test';
    data['left_handed'] = 'leftHanded_test';
    data['click_method'] = 'clickMethod_test';
    data['middle_emulation'] = 'middleEmulation_test';
    data['scroll_method'] = 'scrollMethod_test';
    data['scroll_button'] = 0;
    data['scroll_button_lock'] = 'scrollButtonLock_test';
    data['dwt'] = 'dwt_test';
    data['dwtp'] = 'dwtp_test';
    data['calibration_matrix'] = [0.0, 1.0, 2.0];
    return data;
  }
}

void main() {
  group('Input model', () {
    test('props are correct', () {
      const input = Input(
        identifier: 'identifier_test',
        name: 'name_test',
        vendor: 0,
        product: 0,
        type: 'type_test',
      );
      expect(
        input.props,
        equals(['identifier_test']),
      );
    });
    group('serialize', () {
      test('with required parameters only', () {
        const input = Input(
          identifier: 'identifier_test',
          name: 'name_test',
          vendor: 0,
          product: 0,
          type: 'type_test',
        );
        final json = input.toJson();
        final identifier = json['identifier'];
        final name = json['name'];
        final vendor = json['vendor'];
        final product = json['product'];
        final type = json['type'];
        final xkbActiveLayoutName = json['xkb_active_layout_name'];
        final xkbLayoutNames = json['xkb_layout_names'];
        final xkbActiveLayoutIndex = json['xkb_active_layout_index'];
        final scrollFactor = json['scroll_factor'];
        final libinput = json['libinput'];

        expect(
          identifier,
          'identifier_test',
        );

        expect(
          name,
          'name_test',
        );

        expect(
          vendor,
          0,
        );

        expect(
          product,
          0,
        );

        expect(
          type,
          'type_test',
        );

        expect(
          xkbActiveLayoutName,
          null,
        );

        expect(
          xkbLayoutNames,
          null,
        );

        expect(
          xkbActiveLayoutIndex,
          null,
        );

        expect(
          scrollFactor,
          null,
        );

        expect(
          libinput,
          null,
        );
      });

      test('with all parameters', () {
        final libinputMock = _MockLibInput();
        final input = Input(
          identifier: 'identifier_test',
          name: 'name_test',
          vendor: 0,
          product: 0,
          type: 'type_test',
          xkbActiveLayoutName: 'xkbActiveLayoutName_test',
          xkbLayoutNames: const ['0', '1', '2'],
          xkbActiveLayoutIndex: 0,
          scrollFactor: 1.2,
          libinput: libinputMock,
        );
        final json = input.toJson();
        final identifier = json['identifier'];
        final name = json['name'];
        final vendor = json['vendor'];
        final product = json['product'];
        final type = json['type'];
        final xkbActiveLayoutName = json['xkb_active_layout_name'];
        final xkbLayoutNames = json['xkb_layout_names'];
        final xkbActiveLayoutIndex = json['xkb_active_layout_index'];
        final scrollFactor = json['scroll_factor'];
        final libinput = json['libinput'];

        expect(
          identifier,
          'identifier_test',
        );

        expect(
          name,
          'name_test',
        );

        expect(
          vendor,
          0,
        );

        expect(
          product,
          0,
        );

        expect(
          type,
          'type_test',
        );

        expect(
          xkbActiveLayoutName,
          'xkbActiveLayoutName_test',
        );

        expect(
          xkbLayoutNames,
          const ['0', '1', '2'],
        );

        expect(
          xkbActiveLayoutIndex,
          0,
        );

        expect(
          scrollFactor,
          1.2,
        );

        expect(
          libinput,
          libinputMock.toJson(),
        );
      });
    });

    group('deserialize', () {
      test('with required parameters only', () {
        final json = {
          'identifier': 'identifier_test',
          'name': 'name_test',
          'vendor': 0,
          'product': 0,
          'type': 'type_test',
        };
        final input = Input.fromJson(json);
        expect(
          json,
          input.toJson(),
        );

        expect(
          input.identifier,
          'identifier_test',
        );

        expect(
          input.name,
          'name_test',
        );

        expect(
          input.vendor,
          0,
        );

        expect(
          input.product,
          0,
        );

        expect(
          input.type,
          'type_test',
        );

        expect(
          input.xkbActiveLayoutName,
          null,
        );

        expect(
          input.xkbLayoutNames,
          null,
        );

        expect(
          input.xkbActiveLayoutIndex,
          null,
        );

        expect(
          input.scrollFactor,
          null,
        );

        expect(
          input.libinput,
          null,
        );
      });

      test('with all parameters', () {
        final libinputMock = _MockLibInput();

        final json = {
          'identifier': 'identifier_test',
          'name': 'name_test',
          'vendor': 0,
          'product': 0,
          'type': 'type_test',
          'xkb_active_layout_name': 'xkbActiveLayoutName_test',
          'xkb_layout_names': const ['0', '1', '2'],
          'xkb_active_layout_index': 0,
          'scroll_factor': 1.2,
          'libinput': libinputMock.toJson(),
        };
        final input = Input.fromJson(json);

        expect(
          json,
          input.toJson(),
        );

        expect(
          input.identifier,
          'identifier_test',
        );

        expect(
          input.name,
          'name_test',
        );

        expect(
          input.vendor,
          0,
        );

        expect(
          input.product,
          0,
        );

        expect(
          input.type,
          'type_test',
        );

        expect(
          input.xkbActiveLayoutName,
          'xkbActiveLayoutName_test',
        );

        expect(
          input.xkbLayoutNames,
          const ['0', '1', '2'],
        );

        expect(
          input.xkbActiveLayoutIndex,
          0,
        );

        expect(
          input.scrollFactor,
          1.2,
        );

        expect(
          input.libinput?.toJson(),
          libinputMock.toJson(),
        );
      });
    });
  });
}
