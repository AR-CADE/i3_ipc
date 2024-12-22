import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:i3_ipc/core/tools/ipc_magic.dart';
import 'package:i3_ipc/core/tools/ipc_payload_type.dart';
import 'package:i3_ipc/data/models/ipc_response.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

@immutable
class I3IpcCommandApi {
  I3IpcCommandApi(
    RawSocket socket,
    int type, {
    required String pid,
    String payload = '',
    StreamController<IPCResponse?>? controller,
  })  : _pid = pid,
        _controller = controller {
    streamListener = socket.asBroadcastStream().listen(
      (event) {
        if (event == RawSocketEvent.read) {
          final response = _ipcRecvResponse(socket);
          if (response == null ||
              (_controller != null && _controller.isClosed)) {
            streamListener.cancel();
            socket.close();
            return;
          }
          _controller?.add(response);
          if (type != IpcPayloadType.ipcSubscribe) {
            streamListener.cancel();
            socket.close();
          }
        } else if (event == RawSocketEvent.closed ||
            event == RawSocketEvent.readClosed) {
          streamListener.cancel();
          socket.close();
        }
      },
      onError: (Object error, StackTrace s) {
        stderr.writeln('error $error');
        _controller?.addError(error, s);
      },
      cancelOnError: false,
    );

    _controller?.onCancel = () {
      streamListener.cancel();
      socket.close();
    };

    final header = _buildHeader(type, payload);
    if (socket.write(utf8.encode(header)) == -1) {
      _clientAbort('Unable to send IPC header');
    }

    if (socket.write(utf8.encode(payload)) == -1) {
      _clientAbort('Unable to send IPC payload');
    }
  }

  final String _pid;
  final StreamController<IPCResponse?>? _controller;
  late final StreamSubscription<RawSocketEvent> streamListener;

  void _clientAbort(
    String message,
  ) {
    _controller?.addError(message);
    throw Exception(message);
  }

  String _buildHeader(
    int type,
    String payload,
  ) {
    final endian = Endian.host;
    final data = ByteData(IpcMagic.size);
    for (var i = 0; i < IpcMagic.asUtf8Encoded.length; i++) {
      data.setUint8(i, IpcMagic.asUtf8Encoded.elementAt(i));
    }
    data
      ..setUint32(IpcMagic.asUtf8Encoded.length, payload.length, endian)
      ..setInt32(IpcMagic.asUtf8Encoded.length + 4, type, endian);

    return utf8.decode(data.buffer.asUint8List());
  }

  IPCResponse? _ipcRecvResponse(
    RawSocket socket,
  ) {
    final endian = Endian.host;
    final data = ByteData(IpcMagic.size);
    var total = 0;
    while (total < IpcMagic.size) {
      final received = socket.read(IpcMagic.size - total);
      if (received == null || received.isEmpty) {
        _clientAbort('Unable to receive IPC response');
        return null;
      }
      var offset = 0;
      for (final byte in received) {
        data.setUint8(total + offset, byte);
        offset++;
      }
      total += received.length;
    }

    // final magic = utf8.decode(data.buffer
    //     .asUint8List()
    //     .getRange(0, Magic.asUtf8Encoded.length)
    //     .toList());
    final size = data.getUint32(IpcMagic.asUtf8Encoded.length, endian);

    total = 0;
    final payload = ByteData(size);

    while (total < size) {
      final received = socket.read(size - total);
      if (received == null || received.isEmpty) {
        _clientAbort('Unable to receive IPC response');
        return null;
      }
      var offset = 0;
      for (final byte in received) {
        payload.setUint8(offset, byte);
        offset++;
      }
      total += received.length;
    }

    return IPCResponse(
      id: const Uuid().v4(),
      pid: _pid,
      size: size,
      type: data.getUint32(IpcMagic.asUtf8Encoded.length + 4, endian),
      payload: utf8.decode(payload.buffer.asUint8List()),
    );
  }
}
