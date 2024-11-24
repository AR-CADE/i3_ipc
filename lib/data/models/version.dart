import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'version.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Version extends Equatable {
  const Version({
    required this.humanReadable,
    required this.variant,
    required this.major,
    required this.minor,
    required this.patch,
    required this.loadedConfigFileName,
  });

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);

  Map<String, dynamic> toJson() => _$VersionToJson(this);

  @JsonKey(name: 'human_readable')
  final String humanReadable;
  final String variant;
  final int major;
  final int minor;
  final int patch;
  @JsonKey(name: 'loaded_config_file_name')
  final String loadedConfigFileName;

  @override
  List<dynamic> get props =>
      [major, minor, patch, variant, humanReadable, loadedConfigFileName];
}
