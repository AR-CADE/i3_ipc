import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Config extends Equatable {
  const Config({
    required this.config,
  });

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigToJson(this);

  final String config;

  @override
  List<dynamic> get props => [config];
}
