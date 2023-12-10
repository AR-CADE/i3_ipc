import 'dart:async';
import 'dart:io';

import 'package:i3_ipc/api/ipc_command_api.dart';
import 'package:i3_ipc/data/models/ipc_response.dart';

class I3IpcSocketApi {
  const I3IpcSocketApi();

  Future<RawSocket> _ipcOpenSocket(
    String socketPath, {
    Duration timeout = const Duration(seconds: 2),
  }) {
    const port = 0;
    final host = InternetAddress(socketPath, type: InternetAddressType.unix);
    final socket = RawSocket.connect(host, port, timeout: timeout);

    return socket;
  }

  Future<RawSocket> getSocket({
    String? socketPath,
    Duration timeout = const Duration(seconds: 2),
  }) {
    socketPath = socketPath ?? _getSocketpath();
    return _ipcOpenSocket(socketPath!, timeout: timeout);
  }

  int get _getuid => 1000;

  String? _getSocketpath() {
    final getenv = Platform.environment;

    final wfsock = getenv['WAYFIRESOCK'];
    if (wfsock != null) {
      return wfsock;
    }

    final swaysock = getenv['SWAYSOCK'];
    if (swaysock != null) {
      return swaysock;
    }

    final i3sock = getenv['I3SOCK'];
    if (i3sock != null) {
      return i3sock;
    }

    var dir = getenv['XDG_RUNTIME_DIR'];
    dir ??= '/tmp';

    const pathSize = 108;
    final sunPath = '$dir/wf-ipc.$_getuid.sock';

    if (sunPath.length >= pathSize) {
      stderr.writeln('Socket path is too long');
      return null;
    }

    return sunPath;
  }

  void execute(
    int type, {
    required String pid,
    String payload = '',
    StreamController<IPCResponse?>? controller,
    String? socketPath,
    Duration timeout = const Duration(seconds: 2),
  }) {
    getSocket(socketPath: socketPath, timeout: timeout).then(
      (socket) => I3IpcCommandApi(
        socket,
        type,
        pid: pid,
        payload: payload,
        controller: controller,
      ),
    );
  }
}
