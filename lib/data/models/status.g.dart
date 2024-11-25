// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      success: json['success'] as bool?,
      parseError: json['parse_error'] as bool?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'success': instance.success,
      if (instance.parseError case final value?) 'parse_error': value,
      if (instance.error case final value?) 'error': value,
    };
