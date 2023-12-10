import 'dart:convert';

class IpcMagic {
  const IpcMagic();

  static final List<int> _ipcMagic = utf8.encode(asString);
  static final int _ipcHeaderSize = _ipcMagic.length + 8;

  static int get size => _ipcHeaderSize;
  static List<int> get asUtf8Encoded => _ipcMagic;
  static String get asString => 'i3-ipc';
}
