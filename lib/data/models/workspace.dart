import 'package:equatable/equatable.dart';
import 'package:i3_ipc/data/models/rect.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workspace.g.dart';

@JsonSerializable()
class Workspace extends Equatable {
  const Workspace({
    required this.num,
    required this.name,
    required this.visible,
    required this.focused,
    required this.urgent,
    required this.rect,
    required this.output,
    this.layout,
    this.representation,
  });

  factory Workspace.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceFromJson(json);

  Map<String, dynamic> toJson() => _$WorkspaceToJson(this);

  /// The workspace number or -1 for workspaces that do not start with a number
  final int num;

  /// The name of the workspace
  final String name;

  ///  Whether the workspace is currently visible on any output
  final bool visible;

  /// Whether the workspace is currently focused by the default seat (seat0)
  final bool focused;

  /// Whether this output is active/enabled
  final bool urgent;

  /// The bounds for the output consisting of x, y, width, and height
  final Rect rect;

  /// The name of the output that the workspace is on
  final String output;

  // not documented
  final String? layout;
  final String? representation;

  @override
  List<dynamic> get props => [num, name, output];
}
