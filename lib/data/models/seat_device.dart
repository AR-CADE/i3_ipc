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

  factory SeatDevice.fromJSON(Map<String, dynamic> json) {
    List<String>? xkbLayoutNames;
    {
      final iterable = json['xkb_layout_names'] as Iterable<dynamic>?;
      if (iterable != null) {
        xkbLayoutNames = <String>[];
        for (final e in iterable) {
          xkbLayoutNames.add(e as String);
        }
      }
    }
    return SeatDevice(
      identifier: json['identifier'] as String,
      name: json['name'] as String,
      vendor: json['vendor'] as int,
      product: json['product'] as int,
      type: json['type'] as String,
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

  Map<String, dynamic> toJSON() {
    final data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['name'] = name;
    data['vendor'] = vendor;
    data['product'] = product;
    data['type'] = type;
    data['xkb_active_layout_name'] = xkbActiveLayoutName;
    data['xkb_layout_names'] = xkbLayoutNames;
    data['xkb_active_layout_index'] = xkbActiveLayoutIndex;
    data['repeat_delay'] = repeatDelay;
    data['repeat_rate'] = repeatRate;
    return data;
  }

  @override
  List<Object?> get props => [identifier];
}
