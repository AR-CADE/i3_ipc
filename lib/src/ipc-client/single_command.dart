import 'dart:async';
import 'dart:typed_data';

import 'ipc_client.dart';
import 'models/ipc_payload_type.dart';
import 'models/ipc_response.dart';

class I3SingleCommand {
  static Future<IPCResponse?> getTree(
      {String? socketPath,
      Duration timeout = const Duration(seconds: 2),
      Endian endian = Endian.little}) {
    return exec(IPCPayloadType.ipcGetTree,
        socketPath: socketPath, timeout: timeout, endian: endian);
  }

  static Future<IPCResponse?> getOutputs(
      {String? socketPath,
      Duration timeout = const Duration(seconds: 2),
      Endian endian = Endian.little}) {
    return exec(IPCPayloadType.ipcGetOutputs,
        socketPath: socketPath, timeout: timeout, endian: endian);
  }

  static Future<IPCResponse?> getBarConfig(
      {String? socketPath,
      Duration timeout = const Duration(seconds: 2),
      Endian endian = Endian.little}) {
    return exec(IPCPayloadType.ipcGetBarConfig,
        socketPath: socketPath, timeout: timeout, endian: endian);
  }

  static Future<IPCResponse?> getBindingModes(
      {String? socketPath,
      Duration timeout = const Duration(seconds: 2),
      Endian endian = Endian.little}) {
    return exec(IPCPayloadType.ipcGetBindingModes,
        socketPath: socketPath, timeout: timeout, endian: endian);
  }

  static Future<IPCResponse?> getBindingState(
      {String? socketPath,
      Duration timeout = const Duration(seconds: 2),
      Endian endian = Endian.little}) {
    return exec(IPCPayloadType.ipcGetBindingState,
        socketPath: socketPath, timeout: timeout, endian: endian);
  }

  static Future<IPCResponse?> getConfig(
      {String? socketPath,
      Duration timeout = const Duration(seconds: 2),
      Endian endian = Endian.little}) {
    return exec(IPCPayloadType.ipcGetConfig,
        socketPath: socketPath, timeout: timeout, endian: endian);
  }

  static Future<IPCResponse?> getInputs(
      {String? socketPath,
      Duration timeout = const Duration(seconds: 2),
      Endian endian = Endian.little}) {
    return exec(IPCPayloadType.ipcGetInputs,
        socketPath: socketPath, timeout: timeout, endian: endian);
  }

  static Future<IPCResponse?> getMarks(
      {String? socketPath,
      Duration timeout = const Duration(seconds: 2),
      Endian endian = Endian.little}) {
    return exec(IPCPayloadType.ipcGetMarks,
        socketPath: socketPath, timeout: timeout, endian: endian);
  }

  static Future<IPCResponse?> getSeats(
      {String? socketPath,
      Duration timeout = const Duration(seconds: 2),
      Endian endian = Endian.little}) {
    return exec(IPCPayloadType.ipcGetSeats,
        socketPath: socketPath, timeout: timeout, endian: endian);
  }

  static Future<IPCResponse?> getVersion(
      {String? socketPath,
      Duration timeout = const Duration(seconds: 2),
      Endian endian = Endian.little}) {
    return exec(IPCPayloadType.ipcGetVersion,
        socketPath: socketPath, timeout: timeout, endian: endian);
  }

  static Future<IPCResponse?> getWorkspaces(
      {String? socketPath,
      Duration timeout = const Duration(seconds: 2),
      Endian endian = Endian.little}) {
    return exec(IPCPayloadType.ipcGetWorkspaces,
        socketPath: socketPath, timeout: timeout, endian: endian);
  }

  static Future<IPCResponse?> exec(int type,
      {String? socketPath,
      String payload = "",
      Duration timeout = const Duration(seconds: 2),
      Endian endian = Endian.little}) {
    final controller = StreamController<IPCResponse?>();
    IPCClient.singleCommand(type,
        payload: payload,
        controller: controller,
        endian: endian,
        socketPath: socketPath,
        timeout: timeout);

    return controller.stream.first.then((value) {
      controller.close();
      return value;
    });
  }
}
