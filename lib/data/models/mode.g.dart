// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mode _$ModeFromJson(Map<String, dynamic> json) => Mode(
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      refresh: (json['refresh'] as num).toInt(),
      modePictureAspectRatio: json['picture_aspect_ratio'] as String?,
    );

Map<String, dynamic> _$ModeToJson(Mode instance) {
  final val = <String, dynamic>{
    'width': instance.width,
    'height': instance.height,
    'refresh': instance.refresh,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('picture_aspect_ratio', instance.modePictureAspectRatio);
  return val;
}
