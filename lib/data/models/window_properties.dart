import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'window_properties.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class WindowProperties extends Equatable {
  const WindowProperties({
    required this.clazz,
    required this.instance,
    required this.title,
    this.transientFor,
  });

  factory WindowProperties.fromJson(Map<String, dynamic> json) =>
      _$WindowPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$WindowPropertiesToJson(this);

  @JsonKey(name: 'class')
  final String clazz;
  final String instance;
  final String title;
  @JsonKey(name: 'transient_for')
  final String? transientFor;

  @override
  List<dynamic> get props => [clazz, instance, title, transientFor];
}
