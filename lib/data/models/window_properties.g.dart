// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'window_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WindowProperties _$WindowPropertiesFromJson(Map<String, dynamic> json) =>
    WindowProperties(
      clazz: json['class'] as String,
      instance: json['instance'] as String,
      title: json['title'] as String,
      transientFor: json['transient_for'] as String?,
    );

Map<String, dynamic> _$WindowPropertiesToJson(WindowProperties instance) {
  final val = <String, dynamic>{
    'class': instance.clazz,
    'instance': instance.instance,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('transient_for', instance.transientFor);
  return val;
}
