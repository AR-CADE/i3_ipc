import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rect.g.dart';

@JsonSerializable()
class Rect extends Equatable {
  const Rect({
    required this.x,
    required this.y,
    required this.height,
    required this.width,
  });

  factory Rect.fromJson(Map<String, dynamic> json) => _$RectFromJson(json);

  Map<String, dynamic> toJson() => _$RectToJson(this);

  final int height;
  final int width;
  final int x;
  final int y;

  @override
  List<dynamic> get props => [x, y, width, height];
}
