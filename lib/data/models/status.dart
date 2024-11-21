import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'status.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Status extends Equatable {
  const Status({bool? success, this.error}) : success = success ?? true;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);

  final bool success;
  final String? error;

  @override
  List<dynamic> get props => [success, error];
}
