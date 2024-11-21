import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'idle_inhibitor.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class IdleInhibitor extends Equatable {
  const IdleInhibitor({
    required this.application,
    required this.user,
  });

  factory IdleInhibitor.fromJson(Map<String, dynamic> json) =>
      _$IdleInhibitorFromJson(json);

  Map<String, dynamic> toJson() => _$IdleInhibitorToJson(this);

  /// Application can be enabled or none
  final String application;

  /// User can be focus, fullscreen, open, visible or none.
  final String user;

  @override
  List<dynamic> get props => [application, user];
}
