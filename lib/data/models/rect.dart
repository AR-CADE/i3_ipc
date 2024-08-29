class Rect {
  const Rect({
    required this.x,
    required this.y,
    required this.height,
    required this.width,
  });

  factory Rect.fromJson(Map<String, Object?> json) {
    return Rect(
      x: json['x']! as int,
      y: json['y']! as int,
      width: json['width']! as int,
      height: json['height']! as int,
    );
  }
  final int height;
  final int width;
  final int x;
  final int y;

  Map<String, Object?> toJson() {
    final data = <String, Object?>{};
    data['x'] = x;
    data['y'] = y;
    data['width'] = width;
    data['height'] = height;
    return data;
  }
}
