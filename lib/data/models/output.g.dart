// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Output _$OutputFromJson(Map<String, dynamic> json) => Output(
      name: json['name'] as String,
      active: json['active'] as bool,
      rect: Rect.fromJson(json['rect'] as Map<String, dynamic>),
      primary: json['primary'] as bool? ?? false,
      id: (json['id'] as num?)?.toInt(),
      make: json['make'] as String?,
      model: json['model'] as String?,
      serial: json['serial'] as String?,
      power: json['power'] as bool?,
      scale: (json['scale'] as num?)?.toDouble(),
      subpixelHinting: json['subpixel_hinting'] as String?,
      transform: json['transform'] as String?,
      modes: (json['modes'] as List<dynamic>?)
          ?.map((e) => Mode.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentMode: json['current_mode'] == null
          ? null
          : Mode.fromJson(json['current_mode'] as Map<String, dynamic>),
      dpms: json['dpms'] as bool?,
      currentWorkspace: json['current_workspace'] as String?,
      nonDesktop: json['non_desktop'] as bool?,
      focused: json['focused'] as bool?,
      scaleFilter: json['scale_filter'] as String?,
      maxRenderTime: (json['max_render_time'] as num?)?.toInt(),
      adaptiveSyncStatus: json['adaptive_sync_status'] as String?,
    );

Map<String, dynamic> _$OutputToJson(Output instance) => <String, dynamic>{
      'name': instance.name,
      'active': instance.active,
      'rect': instance.rect.toJson(),
      'primary': instance.primary,
      if (instance.id case final value?) 'id': value,
      if (instance.make case final value?) 'make': value,
      if (instance.model case final value?) 'model': value,
      if (instance.serial case final value?) 'serial': value,
      if (instance.power case final value?) 'power': value,
      if (instance.scale case final value?) 'scale': value,
      if (instance.subpixelHinting case final value?) 'subpixel_hinting': value,
      if (instance.transform case final value?) 'transform': value,
      if (instance.modes?.map((e) => e.toJson()).toList() case final value?)
        'modes': value,
      if (instance.currentMode?.toJson() case final value?)
        'current_mode': value,
      if (instance.dpms case final value?) 'dpms': value,
      if (instance.currentWorkspace case final value?)
        'current_workspace': value,
      if (instance.nonDesktop case final value?) 'non_desktop': value,
      if (instance.focused case final value?) 'focused': value,
      if (instance.scaleFilter case final value?) 'scale_filter': value,
      if (instance.maxRenderTime case final value?) 'max_render_time': value,
      if (instance.adaptiveSyncStatus case final value?)
        'adaptive_sync_status': value,
    };
