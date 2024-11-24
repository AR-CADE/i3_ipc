// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lib_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LibInput _$LibInputFromJson(Map<String, dynamic> json) => LibInput(
      sendEvents: json['send_events'] as String?,
      tap: json['tap'] as String?,
      tapButtonMap: json['tap_button_map'] as String?,
      tapDrag: json['tap_drag'] as String?,
      tapDragLock: json['tap_drag_lock'] as String?,
      accelSpeed: (json['accel_speed'] as num?)?.toDouble(),
      accelProfile: json['accel_profile'] as String?,
      naturalScroll: json['natural_scroll'] as String?,
      leftHanded: json['left_handed'] as String?,
      clickMethod: json['click_method'] as String?,
      middleEmulation: json['middle_emulation'] as String?,
      scrollMethod: json['scroll_method'] as String?,
      scrollButton: (json['scroll_button'] as num?)?.toInt(),
      scrollButtonLock: json['scroll_button_lock'] as String?,
      dwt: json['dwt'] as String?,
      dwtp: json['dwtp'] as String?,
      calibrationMatrix: (json['calibration_matrix'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$LibInputToJson(LibInput instance) => <String, dynamic>{
      if (instance.sendEvents case final value?) 'send_events': value,
      if (instance.tap case final value?) 'tap': value,
      if (instance.tapButtonMap case final value?) 'tap_button_map': value,
      if (instance.tapDrag case final value?) 'tap_drag': value,
      if (instance.tapDragLock case final value?) 'tap_drag_lock': value,
      if (instance.accelSpeed case final value?) 'accel_speed': value,
      if (instance.accelProfile case final value?) 'accel_profile': value,
      if (instance.naturalScroll case final value?) 'natural_scroll': value,
      if (instance.leftHanded case final value?) 'left_handed': value,
      if (instance.clickMethod case final value?) 'click_method': value,
      if (instance.middleEmulation case final value?) 'middle_emulation': value,
      if (instance.scrollMethod case final value?) 'scroll_method': value,
      if (instance.scrollButton case final value?) 'scroll_button': value,
      if (instance.scrollButtonLock case final value?)
        'scroll_button_lock': value,
      if (instance.dwt case final value?) 'dwt': value,
      if (instance.dwtp case final value?) 'dwtp': value,
      if (instance.calibrationMatrix case final value?)
        'calibration_matrix': value,
    };
