import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'ipc_response.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class IPCResponse {
  IPCResponse({
    this.type = -1,
    this.size = 0,
    String? id,
    String? pid,
    this.payload,
  })  : _id = id,
        _pid = pid;

  factory IPCResponse.fromJson(Map<String, dynamic> json) =>
      _$IPCResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IPCResponseToJson(this);

  int type = -1;
  int size = 0;
  String? _id;
  String? _pid;
  String? payload;

  String? get id => _id;

  set id(String? value) {
    if (value != null) {
      _id = value;
    }
  }

  String? get pid => _pid;

  set pid(String? value) {
    if (value != null) {
      _pid = value;
    }
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
