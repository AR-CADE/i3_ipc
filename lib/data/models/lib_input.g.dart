// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lib_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LibInput _$LibInputFromJson(Map<String, dynamic> json) => LibInput(
      sendEvents: json['send_events'] as String,
      tap: json['tap'] as String,
      tapButtonMap: json['tap_button_map'] as String,
      tapDrag: json['tap_drag'] as String,
      tapDragLock: json['tap_drag_lock'] as String,
      accelSpeed: (json['accel_speed'] as num).toDouble(),
      accelProfile: json['accel_profile'] as String,
      naturalScroll: json['natural_scroll'] as String,
      leftHanded: json['left_handed'] as String,
      clickMethod: json['click_method'] as String,
      middleEmulation: json['middle_emulation'] as String,
      scrollMethod: json['scroll_method'] as String,
      scrollButton: (json['scroll_button'] as num).toInt(),
      scrollButtonLock: json['scroll_button_lock'] as String,
      dwt: json['dwt'] as String,
      dwtp: json['dwtp'] as String,
      calibrationMatrix: (json['calibration_matrix'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$LibInputToJson(LibInput instance) => <String, dynamic>{
      'send_events': instance.sendEvents,
      'tap': instance.tap,
      'tap_button_map': instance.tapButtonMap,
      'tap_drag': instance.tapDrag,
      'tap_drag_lock': instance.tapDragLock,
      'accel_speed': instance.accelSpeed,
      'accel_profile': instance.accelProfile,
      'natural_scroll': instance.naturalScroll,
      'left_handed': instance.leftHanded,
      'click_method': instance.clickMethod,
      'middle_emulation': instance.middleEmulation,
      'scroll_method': instance.scrollMethod,
      'scroll_button': instance.scrollButton,
      'scroll_button_lock': instance.scrollButtonLock,
      'dwt': instance.dwt,
      'dwtp': instance.dwtp,
      'calibration_matrix': instance.calibrationMatrix,
    };
