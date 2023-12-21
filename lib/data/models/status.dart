class Status {
  const Status({bool? success, this.error}) : success = success ?? true;

  factory Status.fromJSON(Map<String, dynamic> json) {
    return Status(
      success: json['success'] as bool?,
      error: json['error'] as String?,
    );
  }

  final bool success;
  final String? error;

  Map<String, dynamic> toJSON() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['error'] = error;
    return data;
  }
}
