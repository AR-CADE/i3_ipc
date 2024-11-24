// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeatDevice _$SeatDeviceFromJson(Map<String, dynamic> json) => SeatDevice(
      identifier: json['identifier'] as String,
      name: json['name'] as String,
      vendor: (json['vendor'] as num).toInt(),
      product: (json['product'] as num).toInt(),
      type: json['type'] as String,
      xkbActiveLayoutName: json['xkb_active_layout_name'] as String?,
      xkbLayoutNames: (json['xkb_layout_names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      xkbActiveLayoutIndex: (json['xkb_active_layout_index'] as num?)?.toInt(),
      repeatDelay: (json['repeat_delay'] as num?)?.toInt(),
      repeatRate: (json['repeat_rate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SeatDeviceToJson(SeatDevice instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'name': instance.name,
      'vendor': instance.vendor,
      'product': instance.product,
      'type': instance.type,
      if (instance.xkbActiveLayoutName case final value?)
        'xkb_active_layout_name': value,
      if (instance.xkbLayoutNames case final value?) 'xkb_layout_names': value,
      if (instance.xkbActiveLayoutIndex case final value?)
        'xkb_active_layout_index': value,
      if (instance.repeatDelay case final value?) 'repeat_delay': value,
      if (instance.repeatRate case final value?) 'repeat_rate': value,
    };
