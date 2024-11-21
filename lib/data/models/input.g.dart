// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Input _$InputFromJson(Map<String, dynamic> json) => Input(
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
      scrollFactor: (json['scroll_factor'] as num?)?.toDouble(),
      libinput: json['libinput'] == null
          ? null
          : LibInput.fromJson(json['libinput'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InputToJson(Input instance) {
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
  writeNotNull('scroll_factor', instance.scrollFactor);
  writeNotNull('libinput', instance.libinput?.toJson());
  return val;
}
