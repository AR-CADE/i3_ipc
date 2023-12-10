import 'dart:io';

class StringTools {
  const StringTools();

  static String? joinArgs(List<String> args) {
    if (args.isEmpty) {
      stderr.writeln('argc should be positive');
      return null;
    }

    final buffer = StringBuffer();
    for (var i = 0; i < args.length; ++i) {
      if (i > 0) {
        buffer.write(' ');
      }

      buffer.write(args.elementAt(i));
    }

    return buffer.toString();
  }
}
