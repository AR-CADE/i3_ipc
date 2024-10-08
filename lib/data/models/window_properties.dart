class WindowProperties {
  const WindowProperties({
    required this.clazz,
    required this.instance,
    required this.title,
    this.transientFor,
  });

  factory WindowProperties.fromJson(Map<String, Object?> json) {
    return WindowProperties(
      clazz: json['class']! as String,
      instance: json['instance']! as String,
      title: json['title']! as String,
      transientFor: json['transient_for'] as String?,
    );
  }

  final String clazz;
  final String instance;
  final String title;
  final String? transientFor;

  Map<String, Object?> toJson() {
    final data = <String, Object?>{};
    data['class'] = clazz;
    data['instance'] = instance;
    data['title'] = title;
    if (transientFor != null) {
      data['transient_for'] = transientFor;
    }
    return data;
  }
}
