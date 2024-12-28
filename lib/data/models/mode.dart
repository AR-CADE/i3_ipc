import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mode.g.dart';

@JsonSerializable()
class Mode extends Equatable {
  const Mode({
    required this.width,
    required this.height,
    required this.refresh,
    this.modePictureAspectRatio,
  });

  factory Mode.fromJson(Map<String, dynamic> json) => _$ModeFromJson(json);

  Map<String, dynamic> toJson() => _$ModeToJson(this);

  final int width;
  final int height;
  final int refresh;

  // not documented
  @JsonKey(name: 'picture_aspect_ratio')
  final String? modePictureAspectRatio;

  @override
  List<Object?> get props => [width, height, refresh, modePictureAspectRatio];
}
