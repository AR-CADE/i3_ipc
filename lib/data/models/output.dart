import 'package:equatable/equatable.dart';
import 'package:i3_ipc/data/models/mode.dart';
import 'package:i3_ipc/data/models/rect.dart';
import 'package:json_annotation/json_annotation.dart';

part 'output.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Output extends Equatable {
  const Output({
    required this.id,
    required this.name,
    required this.make,
    required this.model,
    required this.serial,
    required this.active,
    required this.power,
    required this.primary,
    required this.scale,
    required this.subpixelHinting,
    required this.transform,
    required this.modes,
    required this.currentMode,
    required this.rect,
    this.dpms,
    this.currentWorkspace,
    this.nonDesktop,
    this.focused,
    this.scaleFilter,
    this.maxRenderTime,
    this.adaptiveSyncStatus,
  });

  factory Output.fromJson(Map<String, dynamic> json) => _$OutputFromJson(json);

  Map<String, dynamic> toJson() => _$OutputToJson(this);

  /// The id of the output
  final int id;

  /// The name of the output. On DRM, this is the connector
  final String name;

  /// The make of the output
  final String make;

  /// The model of the output
  final String model;

  /// The output's serial number as a hexadecimal string
  final String serial;

  /// Whether this output is active/enabled
  final bool active;

  /// Whether this output is on/off
  final bool power;

  /// For i3 compatibility, this will be false.
  /// It does not make sense in Wayland
  final bool primary;

  /// The scale currently in use on the output or -1 for disabled outputs
  final double scale;

  /// The subpixel hinting current in use on the output.
  /// This can be rgb, bgr, vrgb, vbgr, or none
  @JsonKey(name: 'subpixel_hinting')
  final String subpixelHinting;

  /// The transform currently in use for the output.
  /// This can be normal, 90, 180, 270, flipped-90, flipped-180, or flipped-270
  final String transform;

  /// An array of supported mode objects. Each object contains width, height,
  /// and refresh
  final List<Mode> modes;

  /// An object representing the current mode containing width, height,
  /// and refresh
  @JsonKey(name: 'current_mode')
  final Mode currentMode;

  /// The bounds for the output consisting of x, y, width, and height
  final Rect rect;

  /// (Deprecated, use power instead) Whether this output is on/off (via DPMS)
  final bool? dpms;

  /// The workspace currently visible on the output or null for disabled outputs
  @JsonKey(name: 'current_workspace')
  final String? currentWorkspace;

  // not documented
  @JsonKey(name: 'non_desktop')
  final bool? nonDesktop;
  final bool? focused;
  @JsonKey(name: 'scale_filter')
  final String? scaleFilter;
  @JsonKey(name: 'max_render_time')
  final int? maxRenderTime;
  @JsonKey(name: 'adaptive_sync_status')
  final String? adaptiveSyncStatus;

  @override
  List<dynamic> get props => [id];
}
