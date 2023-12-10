import 'package:i3_ipc/data/models/seat_device.dart';
import 'package:test/test.dart';

void main() {
  group('SeatDevice model', () {
    group('serialize', () {
      test('with required parameters only', () {
        const seatDevice = SeatDevice(
          identifier: 'identifier_test',
          name: 'name_test',
          vendor: 0,
          product: 1,
          type: 'type_test',
        );
        final json = seatDevice.toJSON();
        final identifier = json['identifier'];
        final name = json['name'];
        final vendor = json['vendor'];
        final product = json['product'];
        final type = json['type'];
        final xkbActiveLayoutName = json['xkb_active_layout_name'];
        final xkbLayoutNames = json['xkb_layout_names'];
        final xkbActiveLayoutIndex = json['xkb_active_layout_index'];
        final repeatDelay = json['repeat_delay'];
        final repeatRate = json['repeat_rate'];

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
          1,
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
          repeatDelay,
          null,
        );
        expect(
          repeatRate,
          null,
        );
      });

      test('with all parameters', () {
        const seatDevice = SeatDevice(
          identifier: 'identifier_test',
          name: 'name_test',
          vendor: 0,
          product: 1,
          type: 'type_test',
          xkbActiveLayoutName: 'xkbActiveLayoutName_test',
          xkbLayoutNames: ['0', '1'],
          xkbActiveLayoutIndex: 2,
          repeatDelay: 3,
          repeatRate: 4,
        );
        final json = seatDevice.toJSON();
        final identifier = json['identifier'];
        final name = json['name'];
        final vendor = json['vendor'];
        final product = json['product'];
        final type = json['type'];
        final xkbActiveLayoutName = json['xkb_active_layout_name'];
        final xkbLayoutNames = json['xkb_layout_names'];
        final xkbActiveLayoutIndex = json['xkb_active_layout_index'];
        final repeatDelay = json['repeat_delay'];
        final repeatRate = json['repeat_rate'];

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
          1,
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
          ['0', '1'],
        );
        expect(
          xkbActiveLayoutIndex,
          2,
        );
        expect(
          repeatDelay,
          3,
        );
        expect(
          repeatRate,
          4,
        );
      });
    });

    group('deserialize', () {
      test('with required parameters only', () {
        final json = {
          'identifier': 'identifier_test',
          'name': 'name_test',
          'vendor': 0,
          'product': 1,
          'type': 'type_test',
        };
        final seatDevice = SeatDevice.fromJSON(json);

        expect(
          seatDevice.identifier,
          'identifier_test',
        );
        expect(
          seatDevice.name,
          'name_test',
        );
        expect(
          seatDevice.vendor,
          0,
        );
        expect(
          seatDevice.product,
          1,
        );
        expect(
          seatDevice.type,
          'type_test',
        );
        expect(
          seatDevice.xkbActiveLayoutName,
          null,
        );
        expect(
          seatDevice.xkbLayoutNames,
          null,
        );
        expect(
          seatDevice.xkbActiveLayoutIndex,
          null,
        );
        expect(
          seatDevice.repeatDelay,
          null,
        );
        expect(
          seatDevice.repeatRate,
          null,
        );
      });

      test('with required all parameters', () {
        final json = {
          'identifier': 'identifier_test',
          'name': 'name_test',
          'vendor': 0,
          'product': 1,
          'type': 'type_test',
          'xkb_active_layout_name': 'xkbActiveLayoutName_test',
          'xkb_layout_names': ['0', '1'],
          'xkb_active_layout_index': 2,
          'repeat_delay': 3,
          'repeat_rate': 4,
        };
        final seatDevice = SeatDevice.fromJSON(json);

        expect(
          seatDevice.identifier,
          'identifier_test',
        );
        expect(
          seatDevice.name,
          'name_test',
        );
        expect(
          seatDevice.vendor,
          0,
        );
        expect(
          seatDevice.product,
          1,
        );
        expect(
          seatDevice.type,
          'type_test',
        );
        expect(
          seatDevice.xkbActiveLayoutName,
          'xkbActiveLayoutName_test',
        );
        expect(
          seatDevice.xkbLayoutNames,
          ['0', '1'],
        );
        expect(
          seatDevice.xkbActiveLayoutIndex,
          2,
        );
        expect(
          seatDevice.repeatDelay,
          3,
        );
        expect(
          seatDevice.repeatRate,
          4,
        );
      });
    });
  });
}
