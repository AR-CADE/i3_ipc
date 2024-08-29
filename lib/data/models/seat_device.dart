import 'package:equatable/equatable.dart';

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

  factory SeatDevice.fromJson(Map<String, Object?> json) {
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
    return SeatDevice(
      identifier: json['identifier']! as String,
      name: json['name']! as String,
      vendor: json['vendor']! as int,
      product: json['product']! as int,
      type: json['type']! as String,
      xkbActiveLayoutName: json['xkb_active_layout_name'] as String?,
      xkbLayoutNames: xkbLayoutNames,
      xkbActiveLayoutIndex: json['xkb_active_layout_index'] as int?,
      repeatDelay: json['repeat_delay'] as int?,
      repeatRate: json['repeat_rate'] as int?,
    );
  }

  final String identifier;
  final String name;
  final int vendor;
  final int product;
  final String type;
  final String? xkbActiveLayoutName;
  final List<String>? xkbLayoutNames;
  final int? xkbActiveLayoutIndex;
  final int? repeatDelay;
  final int? repeatRate;

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

    if (repeatDelay != null) {
      data['repeat_delay'] = repeatDelay;
    }

    if (repeatRate != null) {
      data['repeat_rate'] = repeatRate;
    }
    return data;
  }

  @override
  List<Object?> get props => [identifier];
}
