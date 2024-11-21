import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'seat_device.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class SeatDevice extends Equatable {
  const SeatDevice({
    required this.identifier,
    required this.name,
    required this.vendor,
    required this.product,
    required this.type,
    this.xkbActiveLayoutName,
    this.xkbLayoutNames,
    this.xkbActiveLayoutIndex,
    this.repeatDelay,
    this.repeatRate,
  });

  factory SeatDevice.fromJson(Map<String, dynamic> json) =>
      _$SeatDeviceFromJson(json);

  Map<String, dynamic> toJson() => _$SeatDeviceToJson(this);

  final String identifier;
  final String name;
  final int vendor;
  final int product;
  final String type;
  @JsonKey(name: 'xkb_active_layout_name')
  final String? xkbActiveLayoutName;
  @JsonKey(name: 'xkb_layout_names')
  final List<String>? xkbLayoutNames;
  @JsonKey(name: 'xkb_active_layout_index')
  final int? xkbActiveLayoutIndex;
  @JsonKey(name: 'repeat_delay')
  final int? repeatDelay;
  @JsonKey(name: 'repeat_rate')
  final int? repeatRate;

  @override
  List<dynamic> get props => [identifier];
}
