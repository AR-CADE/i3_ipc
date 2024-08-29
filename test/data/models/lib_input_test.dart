import 'package:i3_ipc/data/models/lib_input.dart';
import 'package:test/test.dart';

void main() {
  group('LibInput model', () {
    test('serialize', () {
      const workspace = LibInput(
        sendEvents: 'sendEvents_test',
        tap: 'tap_test',
        tapButtonMap: 'tapButtonMap_test',
        tapDrag: 'tapDrag_test',
        tapDragLock: 'tapDragLock_test',
        accelSpeed: 1.2,
        accelProfile: 'accelProfile_test',
        naturalScroll: 'naturalScroll_test',
        leftHanded: 'leftHanded_test',
        clickMethod: 'clickMethod_test',
        middleEmulation: 'middleEmulation_test',
        scrollMethod: 'scrollMethod_test',
        scrollButton: 1,
        scrollButtonLock: 'scrollButtonLock_test',
        dwt: 'dwt_test',
        dwtp: 'dwtp_test',
        calibrationMatrix: [1.0, 2.0],
      );
      final json = workspace.toJson();

      final sendEvents = json['send_events'];
      final tap = json['tap'];
      final tapButtonMap = json['tap_button_map'];
      final tapDrag = json['tap_drag'];
      final tapDragLock = json['tap_drag_lock'];
      final accelSpeed = json['accel_speed'];
      final accelProfile = json['accel_profile'];
      final naturalScroll = json['natural_scroll'];
      final leftHanded = json['left_handed'];
      final clickMethod = json['click_method'];
      final middleEmulation = json['middle_emulation'];
      final scrollMethod = json['scroll_method'];
      final scrollButton = json['scroll_button'];
      final scrollButtonLock = json['scroll_button_lock'];
      final dwt = json['dwt'];
      final dwtp = json['dwtp'];
      final calibrationMatrix = json['calibration_matrix'];

      expect(
        sendEvents,
        'sendEvents_test',
      );
      expect(
        tap,
        'tap_test',
      );
      expect(
        tapButtonMap,
        'tapButtonMap_test',
      );
      expect(
        tapDrag,
        'tapDrag_test',
      );
      expect(
        tapDragLock,
        'tapDragLock_test',
      );
      expect(
        accelSpeed,
        1.2,
      );
      expect(
        accelProfile,
        'accelProfile_test',
      );
      expect(
        naturalScroll,
        'naturalScroll_test',
      );
      expect(
        leftHanded,
        'leftHanded_test',
      );
      expect(
        clickMethod,
        'clickMethod_test',
      );

      expect(
        middleEmulation,
        'middleEmulation_test',
      );
      expect(
        scrollMethod,
        'scrollMethod_test',
      );
      expect(
        scrollButton,
        1,
      );
      expect(
        scrollButtonLock,
        'scrollButtonLock_test',
      );
      expect(
        dwt,
        'dwt_test',
      );
      expect(
        dwtp,
        'dwtp_test',
      );
      expect(
        calibrationMatrix,
        [1.0, 2.0],
      );
    });

    test('deserialize', () {
      final json = {
        'send_events': 'sendEvents_test',
        'tap': 'tap_test',
        'tap_button_map': 'tapButtonMap_test',
        'tap_drag': 'tapDrag_test',
        'tap_drag_lock': 'tapDragLock_test',
        'accel_speed': 1.2,
        'accel_profile': 'accelProfile_test',
        'natural_scroll': 'naturalScroll_test',
        'left_handed': 'leftHanded_test',
        'click_method': 'clickMethod_test',
        'middle_emulation': 'middleEmulation_test',
        'scroll_method': 'scrollMethod_test',
        'scroll_button': 1,
        'scroll_button_lock': 'scrollButtonLock_test',
        'dwt': 'dwt_test',
        'dwtp': 'dwtp_test',
        'calibration_matrix': [1.0, 2.0],
      };
      final libinput = LibInput.fromJson(json);

      expect(
        json,
        libinput.toJson(),
      );

      expect(
        libinput.sendEvents,
        'sendEvents_test',
      );
      expect(
        libinput.tap,
        'tap_test',
      );
      expect(
        libinput.tapButtonMap,
        'tapButtonMap_test',
      );
      expect(
        libinput.tapDrag,
        'tapDrag_test',
      );
      expect(
        libinput.tapDragLock,
        'tapDragLock_test',
      );
      expect(
        libinput.accelSpeed,
        1.2,
      );
      expect(
        libinput.accelProfile,
        'accelProfile_test',
      );
      expect(
        libinput.naturalScroll,
        'naturalScroll_test',
      );
      expect(
        libinput.leftHanded,
        'leftHanded_test',
      );
      expect(
        libinput.clickMethod,
        'clickMethod_test',
      );

      expect(
        libinput.middleEmulation,
        'middleEmulation_test',
      );
      expect(
        libinput.scrollMethod,
        'scrollMethod_test',
      );
      expect(
        libinput.scrollButton,
        1,
      );
      expect(
        libinput.scrollButtonLock,
        'scrollButtonLock_test',
      );
      expect(
        libinput.dwt,
        'dwt_test',
      );
      expect(
        libinput.dwtp,
        'dwtp_test',
      );
      expect(
        libinput.calibrationMatrix,
        [1.0, 2.0],
      );
    });
  });
}
