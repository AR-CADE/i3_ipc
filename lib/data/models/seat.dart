import 'package:equatable/equatable.dart';
import 'package:i3_ipc/data/models/input.dart';
import 'package:json_annotation/json_annotation.dart';

part 'seat.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Seat extends Equatable {
  const Seat({
    required this.name,
    required this.capabilities,
    required this.focus,
    required this.devices,
  });

  factory Seat.fromJson(Map<String, dynamic> json) => _$SeatFromJson(json);

  Map<String, dynamic> toJson() => _$SeatToJson(this);

  /// The unique name for the seat
  final String name;

  /// The number of capabilities that the seat has
  final int capabilities;

  /// The id of the node currently focused by the seat or 0
  /// when the seat is not currently focused by a node
  /// (i.e. a surface layer or xwayland unmanaged has focus)
  final int focus;

  ///  An array of input devices that are attached to the seat. Currently,
  /// this is an array of objects that are identical to
  /// those returned by GET_INPUTS
  final List<Input> devices;

  @override
  List<dynamic> get props => [name];
}
