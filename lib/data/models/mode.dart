class Mode {
  const Mode({
    required this.width,
    required this.height,
    required this.refresh,
    this.modePictureAspectRatio,
  });

  factory Mode.fromJson(Map<String, Object?> json) {
    return Mode(
      width: json['width']! as int,
      height: json['height']! as int,
      refresh: json['refresh']! as int,
      modePictureAspectRatio: json['picture_aspect_ratio'] as String?,
    );
  }
  final int width;
  final int height;
  final int refresh;

  // not documented
  final String? modePictureAspectRatio;

  Map<String, Object?> toJson() {
    final data = <String, Object?>{};
    data['width'] = width;
    data['height'] = height;
    data['refresh'] = refresh;

    if (modePictureAspectRatio != null) {
      data['picture_aspect_ratio'] = modePictureAspectRatio;
    }
    return data;
  }
}
