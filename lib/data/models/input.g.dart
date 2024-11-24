// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Input _$InputFromJson(Map<String, dynamic> json) => Input(
      identifier: json['identifier'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      vendor: (json['vendor'] as num?)?.toInt(),
      product: (json['product'] as num?)?.toInt(),
      xkbActiveLayoutName: json['xkb_active_layout_name'] as String?,
      xkbLayoutNames: (json['xkb_layout_names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      xkbActiveLayoutIndex: (json['xkb_active_layout_index'] as num?)?.toInt(),
      scrollFactor: (json['scroll_factor'] as num?)?.toDouble(),
      libinput: json['libinput'] == null
          ? null
          : LibInput.fromJson(json['libinput'] as Map<String, dynamic>),
      repeatDelay: (json['repeat_delay'] as num?)?.toInt(),
      repeatRate: (json['repeat_rate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$InputToJson(Input instance) => <String, dynamic>{
      'identifier': instance.identifier,
      'name': instance.name,
      'type': instance.type,
      if (instance.vendor case final value?) 'vendor': value,
      if (instance.product case final value?) 'product': value,
      if (instance.xkbActiveLayoutName case final value?)
        'xkb_active_layout_name': value,
      if (instance.xkbLayoutNames case final value?) 'xkb_layout_names': value,
      if (instance.xkbActiveLayoutIndex case final value?)
        'xkb_active_layout_index': value,
      if (instance.scrollFactor case final value?) 'scroll_factor': value,
      if (instance.libinput?.toJson() case final value?) 'libinput': value,
      if (instance.repeatDelay case final value?) 'repeat_delay': value,
      if (instance.repeatRate case final value?) 'repeat_rate': value,
    };
