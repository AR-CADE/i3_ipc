import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Version extends Equatable {
  const Version({
    required this.humanReadable,
    required this.major,
    required this.minor,
    required this.patch,
    required this.loadedConfigFileName,
    this.variant,
  });

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);

  Map<String, dynamic> toJson() => _$VersionToJson(this);

  /// A human readable version string that will likely contain
  /// more useful information such as the git commit short hash and
  /// git branch
  @JsonKey(name: 'human_readable')
  final String humanReadable;

  /// The major version of the server process
  final int major;

  /// The minor version of the server process
  final int minor;

  /// The patch version of the server process
  final int patch;

  /// The path to the loaded config file
  @JsonKey(name: 'loaded_config_file_name')
  final String loadedConfigFileName;

  /// May contain information such as the name of the server process
  final String? variant;

  @override
  List<dynamic> get props =>
      [major, minor, patch, humanReadable, loadedConfigFileName, variant];
}
