// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Version _$VersionFromJson(Map<String, dynamic> json) => Version(
      humanReadable: json['human_readable'] as String,
      major: (json['major'] as num).toInt(),
      minor: (json['minor'] as num).toInt(),
      patch: (json['patch'] as num).toInt(),
      loadedConfigFileName: json['loaded_config_file_name'] as String,
      variant: json['variant'] as String?,
    );

Map<String, dynamic> _$VersionToJson(Version instance) => <String, dynamic>{
      'human_readable': instance.humanReadable,
      'major': instance.major,
      'minor': instance.minor,
      'patch': instance.patch,
      'loaded_config_file_name': instance.loadedConfigFileName,
      if (instance.variant case final value?) 'variant': value,
    };
