import 'package:equatable/equatable.dart';
import 'package:i3_ipc/data/models/seat_device.dart';

class Seat extends Equatable {
  const Seat({
    required this.name,
    required this.capabilities,
    required this.focus,
    required this.devices,
  });

  factory Seat.fromJson(Map<String, Object?> json) {
    final devices = <SeatDevice>[];
    {
      final iterable = json['devices']! as Iterable<Object?>;
      for (final e in iterable) {
        devices.add(SeatDevice.fromJson(e! as Map<String, Object?>));
      }
    }
    return Seat(
      name: json['name']! as String,
      capabilities: json['capabilities']! as int,
      focus: json['focus']! as int,
      devices: devices,
    );
  }

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
  final List<SeatDevice> devices;

  Map<String, Object?> toJson() {
    final data = <String, Object?>{};
    data['name'] = name;
    data['capabilities'] = capabilities;
    data['focus'] = focus;
    data['devices'] = devices.map((m) => m.toJson()).toList();
    return data;
  }

  @override
  List<Object?> get props => [name];
}
