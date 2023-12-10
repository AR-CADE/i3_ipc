import 'package:equatable/equatable.dart';
import 'package:i3_ipc/data/models/rect.dart';

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

  factory Workspace.fromJSON(Map<String, dynamic> json) {
    return Workspace(
      num: json['num'] as int,
      name: json['name'] as String,
      visible: json['visible'] as bool,
      focused: json['focused'] as bool,
      urgent: json['urgent'] as bool,
      rect: Rect.fromJSON(json['rect'] as Map<String, dynamic>),
      output: json['output'] as String,
      layout: json['layout'] as String?,
      representation: json['representation'] as String?,
    );
  }

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

  Map<String, dynamic> toJSON() {
    final data = <String, dynamic>{};
    data['num'] = num;
    data['name'] = name;
    data['visible'] = visible;
    data['focused'] = focused;
    data['urgent'] = urgent;
    data['rect'] = rect.toJSON();
    data['output'] = output;
    data['layout'] = layout;
    data['representation'] = representation;
    return data;
  }

  @override
  List<Object?> get props => [num, name];
}
