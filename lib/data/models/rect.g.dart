// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rect _$RectFromJson(Map<String, dynamic> json) => Rect(
      x: (json['x'] as num).toInt(),
      y: (json['y'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      width: (json['width'] as num).toInt(),
    );

Map<String, dynamic> _$RectToJson(Rect instance) => <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'x': instance.x,
      'y': instance.y,
    };
