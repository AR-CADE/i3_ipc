import 'dart:convert';

class IPCResponse {
  IPCResponse({
    String? id,
    this.type = -1,
    this.size = 0,
    String? pid,
    this.payload,
  })  : _id = id,
        _pid = pid;

  factory IPCResponse.fromJSON(Map<String, dynamic> json) {
    return IPCResponse(
      id: json['id'] as String?,
      type: json['type'] as int,
      size: json['size'] as int,
      pid: json['pid'] as String?,
      payload: json['payload'] as String?,
    );
  }

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

  Map<String, dynamic> toJSON() {
    final data = <String, dynamic>{};
    data['id'] = _id;
    data['type'] = type;
    data['size'] = size;
    data['pid'] = _pid;
    data['payload'] = payload;

    return data;
  }

  @override
  String toString() {
    return jsonEncode(toJSON());
  }
}
