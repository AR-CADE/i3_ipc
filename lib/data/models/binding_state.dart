class BindingState {
  const BindingState({
    required this.name,
  });

  factory BindingState.fromJSON(Map<String, dynamic> json) {
    return BindingState(
      name: json['name'] as String,
    );
  }
  final String name;

  Map<String, dynamic> toJSON() {
    final data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
