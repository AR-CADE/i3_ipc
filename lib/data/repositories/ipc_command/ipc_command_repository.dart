import 'dart:async';

import 'package:i3_ipc/api/ipc_client_api.dart';
import 'package:i3_ipc/core/tools/ipc_payload_type.dart';
import 'package:i3_ipc/data/models/ipc_response.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/transformers.dart';
import 'package:uuid/uuid.dart';

class I3IpcCommandRepository {
  final _map = <String, StreamController<IPCResponse?>>{};

  /// Return the number of process currently running,
  /// Mainly used for testing
  int get processCount => _map.length;
  final _stream = PublishSubject<IPCResponse?>();
  PublishSubject<IPCResponse?> get stream => _stream;

  void _add(IPCResponse? response) {
    if (_stream.isClosed == false) {
      _stream.add(response);
    }
  }

  FutureOr<void> getTree({
    String? socketPath,
    String payload = '',
    Duration timeout = const Duration(seconds: 2),
    I3IpcClientApi client = const I3IpcClientApi(),
  }) async {
    return execute(
      client: client,
      payload: payload,
      IpcPayloadType.ipcGetTree,
      socketPath: socketPath,
      timeout: timeout,
    );
  }

  FutureOr<void> getOutputs({
    String? socketPath,
    String payload = '',
    Duration timeout = const Duration(seconds: 2),
    I3IpcClientApi client = const I3IpcClientApi(),
  }) async {
    return execute(
      client: client,
      payload: payload,
      IpcPayloadType.ipcGetOutputs,
      socketPath: socketPath,
      timeout: timeout,
    );
  }

  FutureOr<void> getBarConfig({
    String? socketPath,
    String payload = '',
    Duration timeout = const Duration(seconds: 2),
    I3IpcClientApi client = const I3IpcClientApi(),
  }) async {
    return execute(
      client: client,
      payload: payload,
      IpcPayloadType.ipcGetBarConfig,
      socketPath: socketPath,
      timeout: timeout,
    );
  }

  FutureOr<void> getBindingModes({
    String? socketPath,
    String payload = '',
    Duration timeout = const Duration(seconds: 2),
    I3IpcClientApi client = const I3IpcClientApi(),
  }) async {
    return execute(
      client: client,
      payload: payload,
      IpcPayloadType.ipcGetBindingModes,
      socketPath: socketPath,
      timeout: timeout,
    );
  }

  FutureOr<void> getBindingState({
    String? socketPath,
    String payload = '',
    Duration timeout = const Duration(seconds: 2),
    I3IpcClientApi client = const I3IpcClientApi(),
  }) {
    return execute(
      client: client,
      payload: payload,
      IpcPayloadType.ipcGetBindingState,
      socketPath: socketPath,
      timeout: timeout,
    );
  }

  FutureOr<void> getConfig({
    String? socketPath,
    String payload = '',
    Duration timeout = const Duration(seconds: 2),
    I3IpcClientApi client = const I3IpcClientApi(),
  }) {
    return execute(
      client: client,
      payload: payload,
      IpcPayloadType.ipcGetConfig,
      socketPath: socketPath,
      timeout: timeout,
    );
  }

  FutureOr<void> getInputs({
    String? socketPath,
    String payload = '',
    Duration timeout = const Duration(seconds: 2),
    I3IpcClientApi client = const I3IpcClientApi(),
  }) {
    return execute(
      client: client,
      payload: payload,
      IpcPayloadType.ipcGetInputs,
      socketPath: socketPath,
      timeout: timeout,
    );
  }

  FutureOr<void> getMarks({
    String? socketPath,
    String payload = '',
    Duration timeout = const Duration(seconds: 2),
    I3IpcClientApi client = const I3IpcClientApi(),
  }) {
    return execute(
      client: client,
      payload: payload,
      IpcPayloadType.ipcGetMarks,
      socketPath: socketPath,
      timeout: timeout,
    );
  }

  FutureOr<void> getSeats({
    String? socketPath,
    String payload = '',
    Duration timeout = const Duration(seconds: 2),
    I3IpcClientApi client = const I3IpcClientApi(),
  }) {
    return execute(
      client: client,
      payload: payload,
      IpcPayloadType.ipcGetSeats,
      socketPath: socketPath,
      timeout: timeout,
    );
  }

  FutureOr<void> getVersion({
    String? socketPath,
    String payload = '',
    Duration timeout = const Duration(seconds: 2),
    I3IpcClientApi client = const I3IpcClientApi(),
  }) {
    return execute(
      client: client,
      payload: payload,
      IpcPayloadType.ipcGetVersion,
      socketPath: socketPath,
      timeout: timeout,
    );
  }

  FutureOr<void> getWorkspaces({
    String? socketPath,
    String payload = '',
    Duration timeout = const Duration(seconds: 2),
    I3IpcClientApi client = const I3IpcClientApi(),
  }) {
    return execute(
      client: client,
      payload: payload,
      IpcPayloadType.ipcGetWorkspaces,
      socketPath: socketPath,
      timeout: timeout,
    );
  }

  FutureOr<void> command({
    String? socketPath,
    String payload = '',
    Duration timeout = const Duration(seconds: 2),
    I3IpcClientApi client = const I3IpcClientApi(),
  }) {
    return execute(
      client: client,
      payload: payload,
      IpcPayloadType.ipcCommand,
      socketPath: socketPath,
      timeout: timeout,
    );
  }

  FutureOr<void> sendTick({
    String? socketPath,
    String payload = '',
    Duration timeout = const Duration(seconds: 2),
    I3IpcClientApi client = const I3IpcClientApi(),
  }) {
    return execute(
      client: client,
      payload: payload,
      IpcPayloadType.ipcSendTick,
      socketPath: socketPath,
      timeout: timeout,
    );
  }

  FutureOr<void> sync({
    String? socketPath,
    String payload = '',
    Duration timeout = const Duration(seconds: 2),
    I3IpcClientApi client = const I3IpcClientApi(),
  }) {
    return execute(
      client: client,
      payload: payload,
      IpcPayloadType.ipcSync,
      socketPath: socketPath,
      timeout: timeout,
    );
  }

  FutureOr<void> subscribeEvents({
    String? socketPath,
    String payload = '',
    Duration timeout = const Duration(seconds: 2),
    I3IpcClientApi client = const I3IpcClientApi(),
  }) {
    final controller = StreamController<IPCResponse?>();
    final uuid = const Uuid().v4();

    client.execute(
      pid: uuid,
      IpcPayloadType.ipcSubscribe,
      payload: payload,
      controller: controller,
      socketPath: socketPath,
      timeout: timeout,
    );

    _addOnClose(uuid, controller);

    StreamSubscription<IPCResponse?>? subscription;
    final stream = controller.stream.asBroadcastStream()
      ..doOnCancel(() {
        subscription?.cancel();
        close(pid: uuid);
      });

    return stream.first.then((status) {
      //print('status: $status');
      subscription = stream.listen(_add);
    });
  }

  FutureOr<void> execute(
    int type, {
    String? socketPath,
    String payload = '',
    Duration timeout = const Duration(seconds: 2),
    I3IpcClientApi client = const I3IpcClientApi(),
  }) {
    final controller = StreamController<IPCResponse?>();
    final uuid = const Uuid().v4();

    client.execute(
      pid: uuid,
      type,
      payload: payload,
      controller: controller,
      socketPath: socketPath,
      timeout: timeout,
    );

    _addOnClose(uuid, controller);

    return controller.stream.first.then((value) {
      close(pid: uuid);
      _add(value);
    });
  }

  void _addOnClose(String pid, StreamController<IPCResponse?> controller) =>
      _map.putIfAbsent(pid, () => controller);

  void close({String? pid}) {
    if (_map.isEmpty) {
      if (_stream.isClosed == false) {
        _stream.close();
      }
      return;
    }

    if (pid != null) {
      final controller = _map[pid];
      if (controller != null) {
        controller.close();
        _map.remove(pid);
      }
      return;
    }

    _map
      ..forEach((_, controller) {
        controller.close();
      })
      ..clear();

    if (_stream.isClosed == false) {
      _stream.close();
    }
  }
}
