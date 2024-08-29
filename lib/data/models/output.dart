import 'package:equatable/equatable.dart';
import 'package:i3_ipc/data/models/mode.dart';
import 'package:i3_ipc/data/models/rect.dart';

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

  factory Output.fromJSON(Map<String, Object?> json) {
    final modes = <Mode>[]..length;
    {
      final iterable = json['modes']! as Iterable<Object?>;
      for (final e in iterable) {
        modes.add(Mode.fromJSON(e! as Map<String, Object?>));
      }
    }

    return Output(
      id: json['id']! as int,
      name: json['name']! as String,
      make: json['make']! as String,
      model: json['model']! as String,
      serial: json['serial']! as String,
      active: json['active']! as bool,
      power: json['power']! as bool,
      primary: json['primary']! as bool,
      scale: json['scale']! as double,
      subpixelHinting: json['subpixel_hinting']! as String,
      transform: json['transform']! as String,
      modes: modes,
      currentMode: Mode.fromJSON(json['current_mode']! as Map<String, Object?>),
      rect: Rect.fromJSON(json['rect']! as Map<String, Object?>),
      dpms: json['dpms'] as bool?,
      currentWorkspace: json['current_workspace'] as String?,
      nonDesktop: json['non_desktop'] as bool?,
      focused: json['focused'] as bool?,
      scaleFilter: json['scale_filter'] as String?,
      maxRenderTime: json['max_render_time'] as int?,
      adaptiveSyncStatus: json['adaptive_sync_status'] as String?,
    );
  }

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
  final String subpixelHinting;

  /// The transform currently in use for the output.
  /// This can be normal, 90, 180, 270, flipped-90, flipped-180, or flipped-270
  final String transform;

  /// An array of supported mode objects. Each object contains width, height,
  /// and refresh
  final List<Mode> modes;

  /// An object representing the current mode containing width, height,
  /// and refresh
  final Mode currentMode;

  /// The bounds for the output consisting of x, y, width, and height
  final Rect rect;

  /// (Deprecated, use power instead) Whether this output is on/off (via DPMS)
  final bool? dpms;

  /// The workspace currently visible on the output or null for disabled outputs
  final String? currentWorkspace;

  // not documented
  final bool? nonDesktop;
  final bool? focused;
  final String? scaleFilter;
  final int? maxRenderTime;
  final String? adaptiveSyncStatus;

  Map<String, Object?> toJSON() {
    final data = <String, Object?>{};
    data['id'] = id;
    data['name'] = name;
    data['make'] = make;
    data['model'] = model;
    data['serial'] = serial;
    data['active'] = active;
    data['power'] = power;
    data['primary'] = primary;
    data['scale'] = scale;
    data['subpixel_hinting'] = subpixelHinting;
    data['transform'] = transform;
    data['modes'] = modes.map((m) => m.toJSON()).toList();
    data['current_mode'] = currentMode.toJSON();
    data['rect'] = rect.toJSON();

    if (dpms != null) {
      data['dpms'] = dpms;
    }

    if (currentWorkspace != null) {
      data['current_workspace'] = currentWorkspace;
    }

    if (nonDesktop != null) {
      data['non_desktop'] = nonDesktop;
    }

    if (focused != null) {
      data['focused'] = focused;
    }

    if (scaleFilter != null) {
      data['scale_filter'] = scaleFilter;
    }

    if (maxRenderTime != null) {
      data['max_render_time'] = maxRenderTime;
    }

    if (adaptiveSyncStatus != null) {
      data['adaptive_sync_status'] = adaptiveSyncStatus;
    }
    return data;
  }

  @override
  List<Object?> get props => [id];
}
