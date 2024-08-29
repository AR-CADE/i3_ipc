class BindingState {
  const BindingState({
    required this.name,
  });

  factory BindingState.fromJson(Map<String, Object?> json) {
    return BindingState(
      name: json['name']! as String,
    );
  }
  final String name;

  Map<String, Object?> toJson() {
    final data = <String, Object?>{};
    data['name'] = name;
    return data;
  }
}
