// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Seat _$SeatFromJson(Map<String, dynamic> json) => Seat(
      name: json['name'] as String,
      capabilities: (json['capabilities'] as num).toInt(),
      focus: (json['focus'] as num).toInt(),
      devices: (json['devices'] as List<dynamic>)
          .map((e) => SeatDevice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeatToJson(Seat instance) => <String, dynamic>{
      'name': instance.name,
      'capabilities': instance.capabilities,
      'focus': instance.focus,
      'devices': instance.devices.map((e) => e.toJson()).toList(),
    };
