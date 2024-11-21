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

Map<String, dynamic> _$SeatDeviceToJson(SeatDevice instance) {
  final val = <String, dynamic>{
    'identifier': instance.identifier,
    'name': instance.name,
    'vendor': instance.vendor,
    'product': instance.product,
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('xkb_active_layout_name', instance.xkbActiveLayoutName);
  writeNotNull('xkb_layout_names', instance.xkbLayoutNames);
  writeNotNull('xkb_active_layout_index', instance.xkbActiveLayoutIndex);
  writeNotNull('repeat_delay', instance.repeatDelay);
  writeNotNull('repeat_rate', instance.repeatRate);
  return val;
}
