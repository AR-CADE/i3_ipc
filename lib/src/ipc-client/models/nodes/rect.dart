class Rect {
  final int height;
  final int width;
  final int x;
  final int y;

  Rect(
      {required this.x,
      required this.y,
      required this.height,
      required this.width});

  factory Rect.fromJson(Map<dynamic, dynamic> json) {
    return Rect(
        x: json['x'] as int,
        y: json['y'] as int,
        width: json['width'] as int,
        height: json['height'] as int);
  }
}
