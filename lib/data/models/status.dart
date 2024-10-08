class Status {
  const Status({bool? success, this.error}) : success = success ?? true;

  factory Status.fromJson(Map<String, Object?> json) {
    return Status(
      success: json['success'] as bool?,
      error: json['error'] as String?,
    );
  }

  final bool success;
  final String? error;

  Map<String, Object?> toJson() {
    final data = <String, Object?>{};
    data['success'] = success;
    if (error != null) {
      data['error'] = error;
    }
    return data;
  }
}
