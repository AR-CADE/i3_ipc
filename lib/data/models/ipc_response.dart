import 'dart:convert';

class IPCResponse {
  IPCResponse({
    this.type = -1,
    this.size = 0,
    String? id,
    String? pid,
    this.payload,
  })  : _id = id,
        _pid = pid;

  factory IPCResponse.fromJSON(Map<String, Object?> json) {
    return IPCResponse(
      type: json['type']! as int,
      size: json['size']! as int,
      id: json['id'] as String?,
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

  Map<String, Object?> toJSON() {
    final data = <String, Object?>{};
    data['type'] = type;
    data['size'] = size;

    if (_id != null) {
      data['id'] = _id;
    }

    if (_pid != null) {
      data['pid'] = _pid;
    }

    if (payload != null) {
      data['payload'] = payload;
    }

    return data;
  }

  @override
  String toString() {
    return jsonEncode(toJSON());
  }
}
