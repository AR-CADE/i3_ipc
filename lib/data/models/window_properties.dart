class WindowProperties {
  const WindowProperties({
    required this.clazz,
    required this.instance,
    required this.title,
    this.transientFor,
  });

  factory WindowProperties.fromJSON(Map<String, dynamic> json) {
    return WindowProperties(
      clazz: json['class'] as String,
      instance: json['instance'] as String,
      title: json['title'] as String,
      transientFor: json['transient_for'] as String?,
    );
  }

  final String clazz;
  final String instance;
  final String title;
  final String? transientFor;

  Map<String, dynamic> toJSON() {
    final data = <String, dynamic>{};
    data['class'] = clazz;
    data['instance'] = instance;
    data['title'] = title;
    data['transient_for'] = transientFor;
    return data;
  }
}
