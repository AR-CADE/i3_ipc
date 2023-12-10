import 'dart:convert';
import 'dart:io';

class IPCResponse {
  IPCResponse({this.type = -1, this.size = 0, String? processId, this.payload})
      : _pid = processId;

  factory IPCResponse.fromJSON(Map<String, dynamic> json) {
    return IPCResponse(
      type: json['type'] as int,
      size: json['size'] as int,
      processId: json['pid'] as String?,
      payload: json['payload'] as String?,
    );
  }

  int type = -1;
  int size = 0;
  String? _pid;
  String? payload;

  String? get pid => _pid;

  set pid(String? value) {
    if (value != null) {
      _pid = value;
    }
  }

  Future<void> writeToFile(String path) async {
    final file = File(path);
    final sink = file.openWrite()..write(payload);
    await sink.close();
  }

  Map<String, dynamic> toJSON() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['size'] = size;
    data['pid'] = pid;
    data['payload'] = payload;

    return data;
  }

  @override
  String toString() {
    return jsonEncode(toJSON());
  }
}
