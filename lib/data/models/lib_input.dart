/// The libinput object describes the device configuration for libinput devices.
/// Only properties that are supported for the device will be added to
/// the object. In addition to the possible options listed, all string
/// properties may also be unknown, in the case that a new option is added
/// to libinput.
class LibInput {
  const LibInput({
    required this.sendEvents,
    required this.tap,
    required this.tapButtonMap,
    required this.tapDrag,
    required this.tapDragLock,
    required this.accelSpeed,
    required this.accelProfile,
    required this.naturalScroll,
    required this.leftHanded,
    required this.clickMethod,
    required this.middleEmulation,
    required this.scrollMethod,
    required this.scrollButton,
    required this.scrollButtonLock,
    required this.dwt,
    required this.dwtp,
    required this.calibrationMatrix,
  });

  factory LibInput.fromJson(Map<String, Object?> json) {
    final calibrationMatrix = <double>[];
    {
      final iterable = json['calibration_matrix']! as Iterable<Object?>;
      for (final e in iterable) {
        calibrationMatrix.add(e! as double);
      }
    }
    return LibInput(
      sendEvents: json['send_events']! as String,
      tap: json['tap']! as String,
      tapButtonMap: json['tap_button_map']! as String,
      tapDrag: json['tap_drag']! as String,
      tapDragLock: json['tap_drag_lock']! as String,
      accelSpeed: json['accel_speed']! as double,
      accelProfile: json['accel_profile']! as String,
      naturalScroll: json['natural_scroll']! as String,
      leftHanded: json['left_handed']! as String,
      clickMethod: json['click_method']! as String,
      middleEmulation: json['middle_emulation']! as String,
      scrollMethod: json['scroll_method']! as String,
      scrollButton: json['scroll_button']! as int,
      scrollButtonLock: json['scroll_button_lock']! as String,
      dwt: json['dwt']! as String,
      dwtp: json['dwtp']! as String,
      calibrationMatrix: calibrationMatrix,
    );
  }

  /// Whether events are being sent by the device. It can be enabled, disabled,
  /// or disabled_on_external_mouse
  final String sendEvents;

  /// Whether tap to click is enabled. It can be enabled or disabled
  final String tap;

  /// The finger to button mapping in use. It can be lmr or lrm
  final String tapButtonMap;

  /// Whether tap-and-drag is enabled. It can be enabled or disabled
  final String tapDrag;

  /// Whether drag-lock is enabled. It can be enabled or disabled
  final String tapDragLock;

  /// The pointer-acceleration in use
  final double accelSpeed;

  /// The acceleration profile in use. It can be none, flat, or adaptive
  final String accelProfile;

  /// Whether natural scrolling is enabled. It can be enabled or disabled
  final String naturalScroll;

  /// Whether left-handed mode is enabled. It can be enabled or disabled
  final String leftHanded;

  /// The click method in use. It can be none, button_areas, or clickfinger
  final String clickMethod;

  /// Whether middle emulation is enabled. It can be enabled or disabled
  final String middleEmulation;

  /// The scroll method in use. It can be none, two_finger, edge,
  /// or on_button_down
  final String scrollMethod;

  /// The scroll button to use when scroll_method is on_button_down.
  /// This will be given as an input event code
  final int scrollButton;

  /// Whether scroll button lock is enabled. It can be enabled or disabled
  final String scrollButtonLock;

  /// Whether disable-while-typing is enabled. It can be enabled or disabled
  final String dwt;

  /// Whether disable-while-trackpointing is enabled.
  /// It can be enabled or disabled
  final String dwtp;

  /// An array of 6 floats representing the calibration matrix for absolute
  /// devices such as touchscreens
  final List<double> calibrationMatrix;

  Map<String, Object?> toJson() {
    final data = <String, Object?>{};
    data['send_events'] = sendEvents;
    data['tap'] = tap;
    data['tap_button_map'] = tapButtonMap;
    data['tap_drag'] = tapDrag;
    data['tap_drag_lock'] = tapDragLock;
    data['accel_speed'] = accelSpeed;
    data['accel_profile'] = accelProfile;
    data['natural_scroll'] = naturalScroll;
    data['left_handed'] = leftHanded;
    data['click_method'] = clickMethod;
    data['middle_emulation'] = middleEmulation;
    data['scroll_method'] = scrollMethod;
    data['scroll_button'] = scrollButton;
    data['scroll_button_lock'] = scrollButtonLock;
    data['dwt'] = dwt;
    data['dwtp'] = dwtp;
    data['calibration_matrix'] = calibrationMatrix;
    return data;
  }
}
