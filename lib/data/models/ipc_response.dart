import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ipc_response.g.dart';

@JsonSerializable()
class IPCResponse extends Equatable {
  const IPCResponse({
    this.type = -1,
    this.size = 0,
    this.id,
    this.pid,
    this.payload,
  });

  factory IPCResponse.fromJson(Map<String, dynamic> json) =>
      _$IPCResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IPCResponseToJson(this);

  final int type;
  final int size;
  final String? id;
  final String? pid;
  final String? payload;

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  @override
  List<Object?> get props => [id ?? pid];
}
