class Version {
  const Version({
    required this.humanReadable,
    required this.variant,
    required this.major,
    required this.minor,
    required this.patch,
    required this.loadedConfigFileName,
  });

  factory Version.fromJson(Map<String, Object?> json) {
    return Version(
      humanReadable: json['human_readable']! as String,
      variant: json['variant']! as String,
      major: json['major']! as int,
      minor: json['minor']! as int,
      patch: json['patch']! as int,
      loadedConfigFileName: json['loaded_config_file_name']! as String,
    );
  }

  final String humanReadable;
  final String variant;
  final int major;
  final int minor;
  final int patch;
  final String loadedConfigFileName;

  Map<String, Object?> toJson() {
    final data = <String, Object?>{};
    data['human_readable'] = humanReadable;
    data['variant'] = variant;
    data['major'] = major;
    data['minor'] = minor;
    data['patch'] = patch;
    data['loaded_config_file_name'] = loadedConfigFileName;
    return data;
  }
}
