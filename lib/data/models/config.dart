class Config {
  const Config({
    required this.config,
  });

  factory Config.fromJSON(Map<String, dynamic> json) {
    return Config(
      config: json['config'] as String,
    );
  }
  final String config;

  Map<String, dynamic> toJSON() {
    final data = <String, dynamic>{};
    data['config'] = config;
    return data;
  }
}
