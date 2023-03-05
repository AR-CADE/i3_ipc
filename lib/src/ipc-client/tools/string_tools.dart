import 'dart:io';

class StringTools {
  static String? joinArgs(List<String> args) {
    if (args.isEmpty) {
      stderr.writeln("argc should be positive");
      return null;
    }

    String res = "";

    for (int i = 0; i < args.length; ++i) {
      if (i > 0) {
        res = "$res ";
      }

      res = res + args.elementAt(i);
    }

    return res;
  }
}
