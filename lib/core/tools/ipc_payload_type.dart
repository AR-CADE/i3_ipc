class IpcPayloadType {
  // i3 command types - see i3's I3_REPLY_TYPE constants
  static const ipcCommand = 0;
  static const ipcGetWorkspaces = 1;
  static const ipcSubscribe = 2;
  static const ipcGetOutputs = 3;
  static const ipcGetTree = 4;
  static const ipcGetMarks = 5;
  static const ipcGetBarConfig = 6;
  static const ipcGetVersion = 7;
  static const ipcGetBindingModes = 8;
  static const ipcGetConfig = 9;
  static const ipcSendTick = 10;
  static const ipcSync = 11;
  static const ipcGetBindingState = 12;

  // sway-specific command types
  static const ipcGetInputs = 100;
  static const ipcGetSeats = 101;

  //
  static const ipcUnsubscribe = 200;

  static const ipcInvalid = -1;
}
