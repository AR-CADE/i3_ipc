import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'models/ipc_payload_type.dart';
import 'models/ipc_response.dart';
import 'models/magic.dart';

class IPCClient {
  static void clientAbort(RawSocket? socket, String message) {
    if (socket != null) {
      socket.close();
    }
    throw message;
  }

  static Future<RawSocket> ipcOpenSocket(String socketPath,
      {Duration timeout = const Duration(seconds: 2)}) {
    int port = 0;
    final host = InternetAddress(socketPath, type: InternetAddressType.unix);
    final socket = RawSocket.connect(host, port, timeout: timeout);

    return socket;
  }

  static IPCResponse? ipcRecvResponse(RawSocket socket,
      {Endian endian = Endian.little}) {
    final data = ByteData(Magic.size);
    var total = 0;
    while (total < Magic.size) {
      Uint8List? received = socket.read(Magic.size - total);
      if (received == null || received.isEmpty) {
        clientAbort(socket, "Unable to receive IPC response");
        return null;
      }
      int offset = 0;
      for (var byte in received) {
        data.setUint8(total + offset, byte);
        offset++;
      }
      total += received.length;
    }

    IPCResponse response = IPCResponse();
    // final magic = utf8.decode(data.buffer
    //     .asUint8List()
    //     .getRange(0, Magic.asUtf8Encoded.length)
    //     .toList());
    response.size = data.getUint32(Magic.asUtf8Encoded.length, endian);
    response.type = data.getInt32(Magic.asUtf8Encoded.length + 4, endian);

    total = 0;
    final payload = ByteData(response.size);

    while (total < response.size) {
      Uint8List? received = socket.read(response.size - total);
      if (received == null || received.isEmpty) {
        clientAbort(socket, "Unable to receive IPC response");
        return null;
      }
      int offset = 0;
      for (var byte in received) {
        payload.setUint8(offset, byte);
        offset++;
      }
      total += received.length;
    }

    response.payload = utf8.decode(payload.buffer.asUint8List());

    return response;
  }

  static String buildHeader(int type, String payload,
      {Endian endian = Endian.little}) {
    var data = ByteData(Magic.size);
    for (var i = 0; i < Magic.asUtf8Encoded.length; i++) {
      data.setUint8(i, Magic.asUtf8Encoded.elementAt(i));
    }
    data.setUint32(Magic.asUtf8Encoded.length, payload.length, endian);
    data.setInt32(Magic.asUtf8Encoded.length + 4, type, endian);

    return utf8.decode(data.buffer.asUint8List());
  }

  static void singleCommand(int type,
      {String payload = "",
      StreamController<IPCResponse?>? controller,
      Endian endian = Endian.little,
      String? socketPath,
      Duration timeout = const Duration(seconds: 2)}) {
    socketPath = socketPath ?? getSocketpath();
    final future = ipcOpenSocket(socketPath!, timeout: timeout);

    future.then((socket) => ipcSingleCommand(socket, type,
        payload: payload, controller: controller, endian: endian));
  }

  static void ipcSingleCommand(RawSocket socket, int type,
      {String payload = "",
      StreamController<IPCResponse?>? controller,
      Endian endian = Endian.little,
      StreamSubscription<RawSocketEvent>? streamListener}) {
    streamListener = socket.asBroadcastStream().listen((event) {
      if (event == RawSocketEvent.read) {
        final response = ipcRecvResponse(socket, endian: endian);
        if (response == null || (controller != null && controller.isClosed)) {
          streamListener?.cancel();
          socket.close();
          return;
        }
        controller?.add(response);
        if (type != IPCPayloadType.ipcSubscribe) {
          streamListener?.cancel();
          socket.close();
        }
      } else if (event == RawSocketEvent.closed ||
          event == RawSocketEvent.readClosed) {
        streamListener?.cancel();
        socket.close();
      }
    }, onError: (error) {
      stderr.writeln("error $error");
    }, cancelOnError: false);

    controller?.onCancel = () {
      streamListener?.cancel();
      socket.close();
    };

    final header = buildHeader(type, payload, endian: endian);
    if (socket.write(utf8.encode(header)) == -1) {
      streamListener.cancel();
      clientAbort(socket, "Unable to send IPC header");
    }

    if (socket.write(utf8.encode(payload)) == -1) {
      streamListener.cancel();
      clientAbort(socket, "Unable to send IPC payload");
    }
  }

  static int getuid() {
    return 1000;
  }

  static String? getSocketpath() {
    final getenv = Platform.environment;

    var wfsock = getenv["WAYFIRESOCK"];
    if (wfsock != null) {
      return wfsock;
    }

    var swaysock = getenv["SWAYSOCK"];
    if (swaysock != null) {
      return swaysock;
    }

    var i3sock = getenv["I3SOCK"];
    if (i3sock != null) {
      return i3sock;
    }

    var dir = getenv["XDG_RUNTIME_DIR"];
    dir ??= "/tmp";

    int pathSize = 108;
    String sunPath = "$dir/wf-ipc.${getuid()}.sock";

    if (sunPath.length >= pathSize) {
      stderr.writeln('Socket path is too long');
      return null;
    }

    return sunPath;
  }
}
