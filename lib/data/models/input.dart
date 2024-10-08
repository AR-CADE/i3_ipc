import 'package:equatable/equatable.dart';
import 'package:i3_ipc/data/models/lib_input.dart';

class Input extends Equatable {
  const Input({
    required this.identifier,
    required this.name,
    required this.vendor,
    required this.product,
    required this.type,
    this.xkbActiveLayoutName,
    this.xkbLayoutNames,
    this.xkbActiveLayoutIndex,
    this.scrollFactor,
    this.libinput,
  });

  factory Input.fromJson(Map<String, Object?> json) {
    List<String>? xkbLayoutNames;
    {
      final iterable = json['xkb_layout_names'] as Iterable<Object?>?;

      if (iterable != null) {
        xkbLayoutNames = <String>[];
        for (final e in iterable) {
          xkbLayoutNames.add(e! as String);
        }
      }
    }

    return Input(
      identifier: json['identifier']! as String,
      name: json['name']! as String,
      vendor: json['vendor']! as int,
      product: json['product']! as int,
      type: json['type']! as String,
      xkbActiveLayoutName: json['xkb_active_layout_name'] as String?,
      xkbLayoutNames: xkbLayoutNames,
      xkbActiveLayoutIndex: json['xkb_active_layout_index'] as int?,
      scrollFactor: json['scroll_factor'] as double?,
      libinput: json['libinput'] != null
          ? LibInput.fromJson(json['libinput']! as Map<String, Object?>)
          : null,
    );
  }

  /// The identifier for the input device
  final String identifier;

  /// The human readable name for the device
  final String name;

  /// The vendor code for the input device
  final int vendor;

  /// The product code for the input device
  final int product;

  /// The device type. Currently this can be keyboard, pointer, touch,
  /// tablet_tool, tablet_pad, or switch
  final String type;

  /// (Only keyboards) The name of the active keyboard layout in use
  final String? xkbActiveLayoutName;

  /// (Only keyboards) A list a layout names configured for the keyboard
  final List<String>? xkbLayoutNames;

  /// (Only keyboards) The index of the active keyboard layout in use
  final int? xkbActiveLayoutIndex;

  /// (Only pointers) Multiplier applied on scroll event values.
  final double? scrollFactor;

  /// (Only libinput devices) An object describing the current device settings.
  final LibInput? libinput;

  Map<String, Object?> toJson() {
    final data = <String, Object?>{};
    data['identifier'] = identifier;
    data['name'] = name;
    data['vendor'] = vendor;
    data['product'] = product;
    data['type'] = type;

    if (xkbActiveLayoutName != null) {
      data['xkb_active_layout_name'] = xkbActiveLayoutName;
    }

    if (xkbLayoutNames != null) {
      data['xkb_layout_names'] = xkbLayoutNames;
    }

    if (xkbActiveLayoutIndex != null) {
      data['xkb_active_layout_index'] = xkbActiveLayoutIndex;
    }

    if (scrollFactor != null) {
      data['scroll_factor'] = scrollFactor;
    }

    if (libinput != null) {
      data['libinput'] = libinput!.toJson();
    }

    return data;
  }

  @override
  List<Object?> get props => [identifier];
}
