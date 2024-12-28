import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lib_input.g.dart';

/// The libinput object describes the device configuration for libinput devices.
/// Only properties that are supported for the device will be added to
/// the object. In addition to the possible options listed, all string
/// properties may also be unknown, in the case that a new option is added
/// to libinput.
@JsonSerializable()
class LibInput extends Equatable {
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

  factory LibInput.fromJson(Map<String, dynamic> json) =>
      _$LibInputFromJson(json);

  Map<String, dynamic> toJson() => _$LibInputToJson(this);

  /// Whether events are being sent by the device. It can be enabled, disabled,
  /// or disabled_on_external_mouse
  @JsonKey(name: 'send_events')
  final String? sendEvents;

  /// Whether tap to click is enabled. It can be enabled or disabled
  final String? tap;

  /// The finger to button mapping in use. It can be lmr or lrm
  @JsonKey(name: 'tap_button_map')
  final String? tapButtonMap;

  /// Whether tap-and-drag is enabled. It can be enabled or disabled
  @JsonKey(name: 'tap_drag')
  final String? tapDrag;

  /// Whether drag-lock is enabled. It can be enabled or disabled
  @JsonKey(name: 'tap_drag_lock')
  final String? tapDragLock;

  /// The pointer-acceleration in use
  @JsonKey(name: 'accel_speed')
  final double? accelSpeed;

  /// The acceleration profile in use. It can be none, flat, or adaptive
  @JsonKey(name: 'accel_profile')
  final String? accelProfile;

  /// Whether natural scrolling is enabled. It can be enabled or disabled
  @JsonKey(name: 'natural_scroll')
  final String? naturalScroll;

  /// Whether left-handed mode is enabled. It can be enabled or disabled
  @JsonKey(name: 'left_handed')
  final String? leftHanded;

  /// The click method in use. It can be none, button_areas, or clickfinger
  @JsonKey(name: 'click_method')
  final String? clickMethod;

  /// Whether middle emulation is enabled. It can be enabled or disabled
  @JsonKey(name: 'middle_emulation')
  final String? middleEmulation;

  /// The scroll method in use. It can be none, two_finger, edge,
  /// or on_button_down
  @JsonKey(name: 'scroll_method')
  final String? scrollMethod;

  /// The scroll button to use when scroll_method is on_button_down.
  /// This will be given as an input event code
  @JsonKey(name: 'scroll_button')
  final int? scrollButton;

  /// Whether scroll button lock is enabled. It can be enabled or disabled
  @JsonKey(name: 'scroll_button_lock')
  final String? scrollButtonLock;

  /// Whether disable-while-typing is enabled. It can be enabled or disabled
  final String? dwt;

  /// Whether disable-while-trackpointing is enabled.
  /// It can be enabled or disabled
  final String? dwtp;

  /// An array of 6 floats representing the calibration matrix for absolute
  /// devices such as touchscreens
  @JsonKey(name: 'calibration_matrix')
  final List<double>? calibrationMatrix;

  @override
  List<Object?> get props => [
        sendEvents,
        tap,
        tapButtonMap,
        tapDrag,
        tapDragLock,
        accelSpeed,
        accelProfile,
        naturalScroll,
        leftHanded,
        clickMethod,
        middleEmulation,
        scrollMethod,
        scrollButton,
        scrollButtonLock,
        dwt,
        dwtp,
        calibrationMatrix,
      ];
}
