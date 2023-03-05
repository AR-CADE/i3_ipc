import 'rect.dart';

class Node {
  final int id;
  final dynamic border;
  final String layout;
  final bool focused;
  final String name;
  final String orientation;
  final bool sticky;
  final String type;
  final bool urgent;
  final dynamic window;
  final Rect? windowRect;
  final Rect decoRect;
  final Rect rect;
  final Rect? geometry;
  final List<String> marks;
  final List<Node> nodes;
  final List<int> focus;
  final List<Node> floatingNodes;

  Node(
      {required this.id,
      required this.border,
      required this.layout,
      required this.focused,
      required this.name,
      required this.orientation,
      required this.sticky,
      required this.type,
      required this.urgent,
      required this.window,
      required this.windowRect,
      required this.decoRect,
      required this.rect,
      required this.geometry,
      required this.marks,
      required this.nodes,
      required this.focus,
      required this.floatingNodes});

  factory Node.fromJson(Map<dynamic, dynamic> json) {
    dynamic marks = json['marks'];
    dynamic nodes = json['nodes'];
    dynamic focus = json['focus'];
    dynamic floatingNodes = json['floating_nodes'];

    return Node(
        id: json['id'] as int,
        border: json['border'],
        layout: json['layout'] as String,
        focused: json['focused'] as bool,
        name: json['name'].toString(),
        orientation: json['orientation'].toString(),
        sticky: json['sticky'] as bool,
        type: json['type'].toString(),
        urgent: json['urgent'] as bool,
        window: json['window'],
        windowRect: json['window_rect'] != null
            ? Rect.fromJson(json['window_rect'])
            : null,
        decoRect: Rect.fromJson(json['deco_rect']),
        rect: Rect.fromJson(json['rect']),
        geometry:
            json['geometry'] != null ? Rect.fromJson(json['geometry']) : null,
        marks: marks is List ? marks.map((e) => e as String).toList() : [],
        nodes: nodes is List ? nodes.map((e) => Node.fromJson(e)).toList() : [],
        focus: focus is List ? focus.map((e) => e as int).toList() : [],
        floatingNodes: floatingNodes is List
            ? floatingNodes.map((e) => Node.fromJson(e)).toList()
            : []);
  }
}
