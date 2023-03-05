import 'dart:convert';
import 'dart:io';

class IPCResponse {
  int _size = 0;

  int get size => _size;

  set size(int? value) {
    if (value != null) {
      _size = value;
    }
  }

  int _type = -1;

  int get type => _type;

  set type(int? value) {
    if (value != null) {
      _type = value;
    }
  }

  String? payload;

  Future<void> writeToFile(String path) async {
    final file = File(path);
    final sink = file.openWrite();
    sink.write(payload);
    await sink.close();
  }

  dynamic toJson() {
    return payload != null ? jsonDecode(payload!) : null;
  }

  @override
  String toString() {
    return payload ?? "";
  }
}
