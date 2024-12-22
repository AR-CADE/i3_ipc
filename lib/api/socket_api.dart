import 'dart:async';
import 'dart:io';

import 'package:i3_ipc/api/ipc_command_api.dart';
import 'package:i3_ipc/data/models/ipc_response.dart';
import 'package:meta/meta.dart';

const defaultPort = 0;
const defaultUid = 1000;
const maxPathSize = 108;

@immutable
class I3IpcSocketApi {
  const I3IpcSocketApi();

  Future<RawSocket> _ipcOpenSocket(
    String socketPath, {
    Duration timeout = const Duration(seconds: 2),
  }) {
    final host = InternetAddress(socketPath, type: InternetAddressType.unix);
    final socket = RawSocket.connect(host, defaultPort, timeout: timeout);

    return socket;
  }

  Future<RawSocket> getSocket({
    String? socketPath,
    Duration timeout = const Duration(seconds: 2),
  }) {
    socketPath = socketPath ?? _getSocketpath();
    return _ipcOpenSocket(socketPath!, timeout: timeout);
  }

  bool _pathIsValid(String sunPath) {
    if (sunPath.length < maxPathSize) {
      if (File(sunPath).existsSync()) {
        return true;
      } else {
        stderr.writeln('No socket file found');
      }
    } else {
      stderr.writeln('Socket path is too long');
    }

    return false;
  }

  String? _getSocketpath() {
    final getenv = Platform.environment;

    final wfi3sock = getenv['WAYFIREI3SOCK'];
    if (wfi3sock != null) {
      return wfi3sock;
    }

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

    final sunPath = '$dir/wf-i3-ipc.$defaultUid.sock';

    if (!_pathIsValid(sunPath)) {
      final legacySunPath = '$dir/wf-ipc.$defaultUid.sock';
      if (!_pathIsValid(legacySunPath)) {
        return null;
      }
      return legacySunPath;
    }

    return sunPath;
  }

  Future<void> execute(
    int type, {
    required String pid,
    String payload = '',
    StreamController<IPCResponse?>? controller,
    String? socketPath,
    Duration timeout = const Duration(seconds: 2),
  }) {
    return getSocket(socketPath: socketPath, timeout: timeout).then(
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
