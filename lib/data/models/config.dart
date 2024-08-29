class Config {
  const Config({
    required this.config,
  });

  factory Config.fromJSON(Map<String, Object?> json) {
    return Config(
      config: json['config']! as String,
    );
  }
  final String config;

  Map<String, Object?> toJSON() {
    final data = <String, Object?>{};
    data['config'] = config;
    return data;
  }
}
