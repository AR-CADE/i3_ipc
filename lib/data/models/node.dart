import 'package:equatable/equatable.dart';
import 'package:i3_ipc/data/models/idle_inhibitor.dart';
import 'package:i3_ipc/data/models/rect.dart';
import 'package:i3_ipc/data/models/window_properties.dart';
import 'package:json_annotation/json_annotation.dart';

part 'node.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Node extends Equatable {
  const Node({
    required this.id,
    required this.name,
    required this.type,
    required this.border,
    required this.currentBorderWidth,
    required this.layout,
    required this.orientation,
    required this.rect,
    required this.windowRect,
    required this.decoRect,
    required this.geometry,
    required this.urgent,
    required this.sticky,
    required this.marks,
    required this.focused,
    required this.focus,
    required this.nodes,
    this.floatingNodes,
    this.percent,
    this.representation,
    this.fullscreenMode,
    this.appId,
    this.pid,
    this.visible,
    this.shell,
    this.inhibitIdle,
    this.idleInhibitors,
    this.window,
    this.windowProperties,
  });

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);

  Map<String, dynamic> toJson() => _$NodeToJson(this);

  /// The internal unique ID for this node
  final int id;

  /// The name of the node such as the output name or window title.
  /// For the scratchpad, this will be __i3_scratch for compatibility with i3.
  final String name;

  /// The node type. It can be root, output, workspace, con, or floating_con
  final String type;

  /// The border style for the node. It can be normal, none, pixel, or csd
  final String border;

  /// Number of pixels used for the border width
  @JsonKey(name: 'current_border_width')
  final int currentBorderWidth;

  /// The node's layout. It can either be splith, splitv, stacked,
  /// tabbed, or output
  final String layout;

  /// The node's orientation. It can be vertical, horizontal, or none
  final String orientation;

  ///  The absolute geometry of the node. The window decorations are
  /// excluded from this, but borders are included.
  final Rect rect;

  /// The geometry of the content inside the node. These coordinates are
  /// relative to the node itself. Window decorations and borders are outside
  /// the window_rect
  @JsonKey(name: 'window_rect')
  final Rect windowRect;

  /// The geometry of the decorations for the node relative to the parent node
  @JsonKey(name: 'deco_rect')
  final Rect decoRect;

  /// The natural geometry of the contents if it were to size itself
  final Rect geometry;

  /// Whether the node or any of its descendants has the urgent hint set.
  /// Note: This may not exist when compiled without xwayland support
  final bool urgent;

  /// Whether the node is sticky (shows on all workspaces)
  final bool sticky;

  /// List of marks assigned to the node
  final List<String> marks;

  /// Whether the node is currently focused by the default seat (seat0)
  final bool focused;

  /// Array of child node IDs in the current focus order
  final List<int> focus;

  /// The tiling children nodes for the node
  final List<Node> nodes;

  /// The floating children nodes for the node
  @JsonKey(name: 'floating_nodes')
  final List<Node>? floatingNodes;

  /// The percentage of the node's parent that it takes up or null for
  /// the root and other special nodes such as the scratchpad
  final double? percent;

  /// `(Only workspaces)` A string representation of the layout of the
  /// workspace that can be used as an aid in submitting reproduction steps for
  /// bug reports
  final String? representation;

  /// `(Only containers and views)` The fullscreen mode of the node.
  /// 0 means none, 1 means full workspace, and 2 means global fullscreen
  @JsonKey(name: 'fullscreen_mode')
  final int? fullscreenMode;

  /// `(Only views)` For an xdg-shell view, the name of the application,
  /// if set. Otherwise, null
  @JsonKey(name: 'app_id')
  final String? appId;

  /// `(Only views)` The PID of the application that owns the view
  final int? pid;

  /// `(Only views)` Whether the node is visible
  final bool? visible;

  /// `(Only views)` The shell of the view, such as xdg_shell or xwayland
  final String? shell;

  /// `(Only views)` Whether the view is inhibiting the idle state.
  @JsonKey(name: 'inhibit_idle')
  final bool? inhibitIdle;

  /// `(Only views)` An object containing the state of the application and
  /// user idle inhibitors. application can be enabled or none. user can be
  /// focus, fullscreen, open, visible or none.
  @JsonKey(name: 'idle_inhibitors')
  final IdleInhibitor? idleInhibitors;

  /// `(Only xwayland views)` The X11 window ID for the xwayland view
  final int? window;

  /// (Only xwayland views) An object containing the title, class, instance,
  /// window_role, window_type, and transient_for for the view
  @JsonKey(name: 'window_properties')
  final WindowProperties? windowProperties;

  @override
  List<dynamic> get props => [id];
}
