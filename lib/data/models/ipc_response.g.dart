// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ipc_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IPCResponse _$IPCResponseFromJson(Map<String, dynamic> json) => IPCResponse(
      type: (json['type'] as num?)?.toInt() ?? -1,
      size: (json['size'] as num?)?.toInt() ?? 0,
      id: json['id'] as String?,
      pid: json['pid'] as String?,
      payload: json['payload'] as String?,
    );

Map<String, dynamic> _$IPCResponseToJson(IPCResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'size': instance.size,
      if (instance.id case final value?) 'id': value,
      if (instance.pid case final value?) 'pid': value,
      if (instance.payload case final value?) 'payload': value,
    };
