import 'dart:async';

import 'package:i3_ipc/api/socket_api.dart';
import 'package:i3_ipc/data/models/ipc_response.dart';

class I3IpcClientApi {
  const I3IpcClientApi();

  void execute(
    int type, {
    required String pid,
    String payload = '',
    StreamController<IPCResponse?>? controller,
    String? socketPath,
    Duration timeout = const Duration(seconds: 2),
    I3IpcSocketApi socket = const I3IpcSocketApi(),
  }) {
    socket.execute(
      type,
      pid: pid,
      payload: payload,
      controller: controller,
      timeout: timeout,
      socketPath: socketPath,
    );
  }
}
