import 'package:equatable/equatable.dart';
import 'package:i3_ipc/data/models/lib_input.dart';
import 'package:json_annotation/json_annotation.dart';

part 'input.g.dart';

@JsonSerializable()
class Input extends Equatable {
  const Input({
    required this.identifier,
    required this.name,
    required this.type,
    this.vendor,
    this.product,
    this.xkbActiveLayoutName,
    this.xkbLayoutNames,
    this.xkbActiveLayoutIndex,
    this.scrollFactor,
    this.libinput,
    this.repeatDelay,
    this.repeatRate,
  });

  factory Input.fromJson(Map<String, dynamic> json) => _$InputFromJson(json);

  Map<String, dynamic> toJson() => _$InputToJson(this);

  /// The identifier for the input device
  final String identifier;

  /// The human readable name for the device
  final String name;

  /// The device type. Currently this can be keyboard, pointer, touch,
  /// tablet_tool, tablet_pad, or switch
  final String type;

  /// The vendor code for the input device
  final int? vendor;

  /// The product code for the input device
  final int? product;

  /// (Only keyboards) The name of the active keyboard layout in use
  @JsonKey(name: 'xkb_active_layout_name')
  final String? xkbActiveLayoutName;

  /// (Only keyboards) A list a layout names configured for the keyboard
  @JsonKey(name: 'xkb_layout_names')
  final List<String>? xkbLayoutNames;

  /// (Only keyboards) The index of the active keyboard layout in use
  @JsonKey(name: 'xkb_active_layout_index')
  final int? xkbActiveLayoutIndex;

  /// (Only pointers) Multiplier applied on scroll event values.
  @JsonKey(name: 'scroll_factor')
  final double? scrollFactor;

  /// (Only libinput devices) An object describing the current device settings.
  final LibInput? libinput;

  @JsonKey(name: 'repeat_delay')
  final int? repeatDelay;
  @JsonKey(name: 'repeat_rate')
  final int? repeatRate;

  @override
  List<dynamic> get props => [identifier];
}
