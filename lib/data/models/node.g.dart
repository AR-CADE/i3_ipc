// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Node _$NodeFromJson(Map<String, dynamic> json) => Node(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      type: json['type'] as String,
      border: json['border'] as String,
      currentBorderWidth: (json['current_border_width'] as num).toInt(),
      layout: json['layout'] as String,
      orientation: json['orientation'] as String,
      rect: Rect.fromJson(json['rect'] as Map<String, dynamic>),
      windowRect: Rect.fromJson(json['window_rect'] as Map<String, dynamic>),
      decoRect: Rect.fromJson(json['deco_rect'] as Map<String, dynamic>),
      geometry: Rect.fromJson(json['geometry'] as Map<String, dynamic>),
      urgent: json['urgent'] as bool,
      sticky: json['sticky'] as bool,
      marks: (json['marks'] as List<dynamic>).map((e) => e as String).toList(),
      focused: json['focused'] as bool,
      focus: (json['focus'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      nodes: (json['nodes'] as List<dynamic>)
          .map((e) => Node.fromJson(e as Map<String, dynamic>))
          .toList(),
      floatingNodes: (json['floating_nodes'] as List<dynamic>?)
          ?.map((e) => Node.fromJson(e as Map<String, dynamic>))
          .toList(),
      percent: (json['percent'] as num?)?.toDouble(),
      representation: json['representation'] as String?,
      fullscreenMode: (json['fullscreen_mode'] as num?)?.toInt(),
      appId: json['app_id'] as String?,
      pid: (json['pid'] as num?)?.toInt(),
      visible: json['visible'] as bool?,
      shell: json['shell'] as String?,
      inhibitIdle: json['inhibit_idle'] as bool?,
      idleInhibitors: json['idle_inhibitors'] == null
          ? null
          : IdleInhibitor.fromJson(
              json['idle_inhibitors'] as Map<String, dynamic>),
      window: (json['window'] as num?)?.toInt(),
      windowProperties: json['window_properties'] == null
          ? null
          : WindowProperties.fromJson(
              json['window_properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NodeToJson(Node instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'border': instance.border,
      'current_border_width': instance.currentBorderWidth,
      'layout': instance.layout,
      'orientation': instance.orientation,
      'rect': instance.rect.toJson(),
      'window_rect': instance.windowRect.toJson(),
      'deco_rect': instance.decoRect.toJson(),
      'geometry': instance.geometry.toJson(),
      'urgent': instance.urgent,
      'sticky': instance.sticky,
      'marks': instance.marks,
      'focused': instance.focused,
      'focus': instance.focus,
      'nodes': instance.nodes.map((e) => e.toJson()).toList(),
      if (instance.floatingNodes?.map((e) => e.toJson()).toList()
          case final value?)
        'floating_nodes': value,
      if (instance.percent case final value?) 'percent': value,
      if (instance.representation case final value?) 'representation': value,
      if (instance.fullscreenMode case final value?) 'fullscreen_mode': value,
      if (instance.appId case final value?) 'app_id': value,
      if (instance.pid case final value?) 'pid': value,
      if (instance.visible case final value?) 'visible': value,
      if (instance.shell case final value?) 'shell': value,
      if (instance.inhibitIdle case final value?) 'inhibit_idle': value,
      if (instance.idleInhibitors?.toJson() case final value?)
        'idle_inhibitors': value,
      if (instance.window case final value?) 'window': value,
      if (instance.windowProperties?.toJson() case final value?)
        'window_properties': value,
    };
