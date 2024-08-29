class IdleInhibitor {
  const IdleInhibitor({
    required this.application,
    required this.user,
  });

  factory IdleInhibitor.fromJson(Map<String, Object?> json) {
    return IdleInhibitor(
      application: json['application']! as String,
      user: json['user']! as String,
    );
  }

  /// Application can be enabled or none
  final String application;

  /// User can be focus, fullscreen, open, visible or none.
  final String user;

  Map<String, Object?> toJson() {
    final data = <String, Object?>{};
    data['application'] = application;
    data['user'] = user;
    return data;
  }
}
