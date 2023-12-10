import 'package:equatable/equatable.dart';
import 'package:i3_ipc/data/models/idle_inhibitor.dart';
import 'package:i3_ipc/data/models/rect.dart';
import 'package:i3_ipc/data/models/window_properties.dart';

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

  factory Node.fromJSON(Map<String, dynamic> json) {
    try {
      final marks = <String>[];
      {
        final iterable = json['marks'] as Iterable<dynamic>;
        for (final e in iterable) {
          marks.add(e as String);
        }
      }

      final focus = <int>[];
      {
        final iterable = json['focus'] as Iterable<dynamic>;
        for (final e in iterable) {
          focus.add(e as int);
        }
      }

      final nodes = <Node>[];
      {
        final iterable = json['nodes'] as Iterable<dynamic>;
        for (final e in iterable) {
          nodes.add(Node.fromJSON(e as Map<String, dynamic>));
        }
      }

      List<Node>? floatingNodes;
      {
        final iterable = json['floating_nodes'] as Iterable<dynamic>?;
        if (iterable != null) {
          floatingNodes = <Node>[];
          for (final e in iterable) {
            floatingNodes.add(Node.fromJSON(e as Map<String, dynamic>));
          }
        }
      }
      return Node(
        id: json['id'] as int,
        name: json['name'] as String,
        type: json['type'] as String,
        border: json['border'] as String,
        currentBorderWidth: json['current_border_width'] as int,
        layout: json['layout'] as String,
        orientation: json['orientation'] as String,
        rect: Rect.fromJSON(json['rect'] as Map<String, dynamic>),
        windowRect: Rect.fromJSON(json['window_rect'] as Map<String, dynamic>),
        decoRect: Rect.fromJSON(json['deco_rect'] as Map<String, dynamic>),
        geometry: Rect.fromJSON(json['geometry'] as Map<String, dynamic>),
        urgent: json['urgent'] as bool,
        sticky: json['sticky'] as bool,
        marks: marks,
        focused: json['focused'] as bool,
        focus: focus,
        nodes: nodes,
        floatingNodes: floatingNodes,
        percent: json['percent'] as double?,
        representation: json['representation'] as String?,
        fullscreenMode: json['fullscreen_mode'] as int?,
        appId: json['app_id'] as String?,
        pid: json['pid'] as int?,
        visible: json['visible'] as bool?,
        shell: json['shell'] as String?,
        inhibitIdle: json['inhibit_idle'] as bool?,
        idleInhibitors: json['idle_inhibitors'] != null
            ? IdleInhibitor.fromJSON(
                json['idle_inhibitors'] as Map<String, dynamic>,
              )
            : null,
        window: json['window'] as int?,
        windowProperties: json['window_properties'] != null
            ? WindowProperties.fromJSON(
                json['window_properties'] as Map<String, dynamic>,
              )
            : null,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

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
  final Rect windowRect;

  /// The geometry of the decorations for the node relative to the parent node
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
  final int? fullscreenMode;

  /// `(Only views)` For an xdg-shell view, the name of the application,
  /// if set. Otherwise, null
  final String? appId;

  /// `(Only views)` The PID of the application that owns the view
  final int? pid;

  /// `(Only views)` Whether the node is visible
  final bool? visible;

  /// `(Only views)` The shell of the view, such as xdg_shell or xwayland
  final String? shell;

  /// `(Only views)` Whether the view is inhibiting the idle state.
  final bool? inhibitIdle;

  /// `(Only views)` An object containing the state of the application and
  /// user idle inhibitors. application can be enabled or none. user can be
  /// focus, fullscreen, open, visible or none.
  final IdleInhibitor? idleInhibitors;

  /// `(Only xwayland views)` The X11 window ID for the xwayland view
  final int? window;

  /// (Only xwayland views) An object containing the title, class, instance,
  /// window_role, window_type, and transient_for for the view
  final WindowProperties? windowProperties;

  Map<String, dynamic> toJSON() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['border'] = border;
    data['current_border_width'] = currentBorderWidth;
    data['layout'] = layout;
    data['orientation'] = orientation;
    data['rect'] = rect.toJSON();
    data['window_rect'] = windowRect.toJSON();
    data['deco_rect'] = decoRect.toJSON();
    data['geometry'] = geometry.toJSON();
    data['urgent'] = urgent;
    data['sticky'] = sticky;
    data['marks'] = marks;
    data['focused'] = focused;
    data['focus'] = focus;
    data['nodes'] = nodes.map((m) => m.toJSON()).toList();
    data['percent'] = percent;
    data['floating_nodes'] = floatingNodes?.map((m) => m.toJSON()).toList();
    data['representation'] = representation;
    data['fullscreen_mode'] = fullscreenMode;
    data['app_id'] = appId;
    data['pid'] = pid;
    data['visible'] = visible;
    data['shell'] = shell;
    data['inhibit_idle'] = inhibitIdle;
    data['idle_inhibitors'] = idleInhibitors?.toJSON();
    data['window'] = window;
    data['window_properties'] = windowProperties?.toJSON();
    return data;
  }

  @override
  List<Object?> get props => [id];
}
