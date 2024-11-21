import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'binding_state.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class BindingState extends Equatable {
  const BindingState({
    required this.name,
  });

  factory BindingState.fromJson(Map<String, dynamic> json) =>
      _$BindingStateFromJson(json);

  Map<String, dynamic> toJson() => _$BindingStateToJson(this);

  final String name;

  @override
  List<dynamic> get props => [name];
}
