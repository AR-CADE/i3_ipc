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

Map<String, dynamic> _$InputToJson(Input instance) => <String, dynamic>{
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
      if (instance.scrollFactor case final value?) 'scroll_factor': value,
      if (instance.libinput?.toJson() case final value?) 'libinput': value,
    };
