class IPCEventType {
  const IPCEventType();

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

  static int eventMask(int ev) => 1 << (ev & 0x8F);

  static int toTypeMask(List<String> list) {
    var subscribedEvents = 0;
    list.map((event) {
      if (event == ipcI3EventWorkspace) {
        subscribedEvents |= eventMask(ipcI3EventTypeWorkspace);
      } else if (event == ipcI3EventShutdown) {
        subscribedEvents |= eventMask(ipcI3EventTypeShutdown);
      } else if (event == ipcI3EventWindow) {
        subscribedEvents |= eventMask(ipcI3EventTypeWindow);
      } else if (event == ipcI3EventTick) {
        subscribedEvents |= eventMask(ipcI3EventTypeTick);
      } else if (event == ipcSwayEventInput) {
        subscribedEvents |= eventMask(ipcSwayEventTypeInput);
      } else if (event == ipcI3EventOutput) {
        subscribedEvents |= eventMask(ipcI3EventTypeOutput);
      }
    });
    return subscribedEvents;
  }

  static List<int> toTypeMaskList(List<String> list) {
    return list.map((event) {
      if (event == ipcI3EventWorkspace) {
        return ipcI3EventTypeWorkspace;
      } else if (event == ipcI3EventShutdown) {
        return ipcI3EventTypeShutdown;
      } else if (event == ipcI3EventWindow) {
        return ipcI3EventTypeWindow;
      } else if (event == ipcI3EventTick) {
        return ipcI3EventTypeTick;
      } else if (event == ipcSwayEventInput) {
        return ipcSwayEventTypeInput;
      } else if (event == ipcI3EventOutput) {
        return ipcI3EventTypeOutput;
      }
      return -1;
    }).toList();
  }

  static List<String> toStringList(int mask) {
    final list = List<String>.empty();
    if ((mask & eventMask(ipcI3EventTypeWorkspace)) != 0) {
      list.add(ipcI3EventWorkspace);
    }
    if ((mask & eventMask(ipcI3EventTypeShutdown)) != 0) {
      list.add(ipcI3EventShutdown);
    }
    if ((mask & eventMask(ipcI3EventTypeWindow)) != 0) {
      list.add(ipcI3EventWindow);
    }
    if ((mask & eventMask(ipcI3EventTypeTick)) != 0) {
      list.add(ipcI3EventTick);
    }
    if ((mask & eventMask(ipcSwayEventTypeInput)) != 0) {
      list.add(ipcSwayEventInput);
    }
    if ((mask & eventMask(ipcI3EventTypeOutput)) != 0) {
      list.add(ipcI3EventOutput);
    }

    return list;
  }
}
