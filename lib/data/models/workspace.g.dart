// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workspace _$WorkspaceFromJson(Map<String, dynamic> json) => Workspace(
      num: (json['num'] as num).toInt(),
      name: json['name'] as String,
      visible: json['visible'] as bool,
      focused: json['focused'] as bool,
      urgent: json['urgent'] as bool,
      rect: Rect.fromJson(json['rect'] as Map<String, dynamic>),
      output: json['output'] as String,
      layout: json['layout'] as String?,
      representation: json['representation'] as String?,
    );

Map<String, dynamic> _$WorkspaceToJson(Workspace instance) {
  final val = <String, dynamic>{
    'num': instance.num,
    'name': instance.name,
    'visible': instance.visible,
    'focused': instance.focused,
    'urgent': instance.urgent,
    'rect': instance.rect.toJson(),
    'output': instance.output,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('layout', instance.layout);
  writeNotNull('representation', instance.representation);
  return val;
}
