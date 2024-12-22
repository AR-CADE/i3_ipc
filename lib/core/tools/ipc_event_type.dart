import 'package:meta/meta.dart';

@immutable
class IPCEventType {
  // events sent from sway to clients. events have the highest bits set.
  static final ipcI3EventTypeWorkspace = (1.toUnsigned(8) << 31) | 0;
  static final ipcI3EventTypeOutput = (1.toUnsigned(8) << 31) | 1;
  static final ipcI3EventTypeMode = (1.toUnsigned(8) << 31) | 2;
  static final ipcI3EventTypeWindow = (1.toUnsigned(8) << 31) | 3;
  static final ipcI3EventTypeBinding = (1.toUnsigned(8) << 31) | 5;
  static final ipcI3EventTypeShutdown = (1.toUnsigned(8) << 31) | 6;
  static final ipcI3EventTypeTick = (1.toUnsigned(8) << 31) | 7;

  // sway-specific event types
  static final ipcSwayEventTypeInput = (1.toUnsigned(8) << 31) | 21;

  //
  // wayfire specific event types
  //
  static const ipcWfEventTypeUnsupported = -1;
  static const ipcWfEventTypeNone = 0;

  static const ipcI3EventWorkspace = 'workspace';
  static const ipcI3EventShutdown = 'shutdown';
  static const ipcI3EventWindow = 'window';
  static const ipcI3EventBinding = 'binding';
  static const ipcI3EventTick = 'tick';

  static const ipcSwayEventInput = 'input';
  static const ipcI3EventOutput = 'output';
}
