import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'status.g.dart';

@JsonSerializable()
class Status extends Equatable {
  const Status({bool? success, this.parseError, this.error})
      : success = success ?? true;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);

  /// A boolean indicating whether the command was successful
  final bool success;

  /// whether the reason the command failed was because the command
  /// was unknown or not able to be parsed.
  @JsonKey(name: 'parse_error')
  final bool? parseError;

  /// A human readable error message
  final String? error;

  @override
  List<dynamic> get props => [success, parseError, error];
}
