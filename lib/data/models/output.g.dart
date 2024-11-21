// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Output _$OutputFromJson(Map<String, dynamic> json) => Output(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      make: json['make'] as String,
      model: json['model'] as String,
      serial: json['serial'] as String,
      active: json['active'] as bool,
      power: json['power'] as bool,
      primary: json['primary'] as bool,
      scale: (json['scale'] as num).toDouble(),
      subpixelHinting: json['subpixel_hinting'] as String,
      transform: json['transform'] as String,
      modes: (json['modes'] as List<dynamic>)
          .map((e) => Mode.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentMode: Mode.fromJson(json['current_mode'] as Map<String, dynamic>),
      rect: Rect.fromJson(json['rect'] as Map<String, dynamic>),
      dpms: json['dpms'] as bool?,
      currentWorkspace: json['current_workspace'] as String?,
      nonDesktop: json['non_desktop'] as bool?,
      focused: json['focused'] as bool?,
      scaleFilter: json['scale_filter'] as String?,
      maxRenderTime: (json['max_render_time'] as num?)?.toInt(),
      adaptiveSyncStatus: json['adaptive_sync_status'] as String?,
    );

Map<String, dynamic> _$OutputToJson(Output instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'make': instance.make,
    'model': instance.model,
    'serial': instance.serial,
    'active': instance.active,
    'power': instance.power,
    'primary': instance.primary,
    'scale': instance.scale,
    'subpixel_hinting': instance.subpixelHinting,
    'transform': instance.transform,
    'modes': instance.modes.map((e) => e.toJson()).toList(),
    'current_mode': instance.currentMode.toJson(),
    'rect': instance.rect.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('dpms', instance.dpms);
  writeNotNull('current_workspace', instance.currentWorkspace);
  writeNotNull('non_desktop', instance.nonDesktop);
  writeNotNull('focused', instance.focused);
  writeNotNull('scale_filter', instance.scaleFilter);
  writeNotNull('max_render_time', instance.maxRenderTime);
  writeNotNull('adaptive_sync_status', instance.adaptiveSyncStatus);
  return val;
}
