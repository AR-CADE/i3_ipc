class Status {
  static bool successObject(dynamic result) {
    if (result is! Map) {
      return false;
    }
    dynamic ret = result["success"];
    if (ret == null || ret is! bool) {
      return true;
    }

    return ret;
  }

// Iterate results array and return false if any of them failed
  static bool success(dynamic r, bool fallback) {
    if (r is! List) {
      if (r is Map) {
        return successObject(r);
      }

      return fallback;
    }

    if (r.isEmpty) {
      return fallback;
    }

    if (r.any((result) => !successObject(result))) {
      return false;
    }

    return true;
  }
}
