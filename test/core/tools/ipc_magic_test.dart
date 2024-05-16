// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:i3_ipc/core/tools/ipc_magic.dart';
import 'package:test/test.dart';

void main() {
  group('IpcMagic', () {
    test('IpcMagic.asString = "i3-ipc"', () {
      expect(
        IpcMagic.asString,
        'i3-ipc',
      );
    });

    test('IpcMagic.asUtf8Encoded is a utf8 encoded version of "i3-ipc"', () {
      expect(
        IpcMagic.asUtf8Encoded,
        utf8.encode('i3-ipc'),
      );
    });

    test(
        'IpcMagic.size is the length of the utf8 encoded version'
        ' of "i3-ipc" + 8 '
        '(4 for the size of the payload and 4 for the type)', () {
      expect(
        IpcMagic.size,
        utf8.encode('i3-ipc').length + 8,
      );
    });
  });
}
