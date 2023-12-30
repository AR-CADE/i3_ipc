import 'dart:async';
import 'dart:convert';

import 'package:i3_ipc/api/ipc_client_api.dart';
import 'package:i3_ipc/core/tools/ipc_payload_type.dart';
import 'package:i3_ipc/data/models/ipc_response.dart';
import 'package:i3_ipc/data/models/status.dart';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/transformers.dart';
import 'package:uuid/uuid.dart';

class I3IpcCommandRepository {
  final _controllers = <String, StreamController<IPCResponse?>>{};
  final _subscriptions =
      <StreamController<IPCResponse?>, StreamSubscription<IPCResponse?>>{};

  /// Return the number of process currently running,
  /// Mainly used for testing
  int get processCount => _controllers.length;
  final _stream = PublishSubject<IPCResponse?>();
  Stream<IPCResponse?> get stream => _stream.stream;

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

    _open(uuid, controller);

    final stream = controller.stream.asBroadcastStream();

    return stream
        .doOnError((_, __) {
          close(pid: uuid);
        })
        .first
        .then((status) {
          _verifySubscriptionStatus(uuid, status);

          final subscription = stream.listen(_add);
          _attachSubscription(controller, subscription);
        });
  }

  void _verifySubscriptionStatus(String pid, IPCResponse? status) {
    final payload = status?.payload;
    var success = false;
    String? error;
    if (payload != null) {
      final json = jsonDecode(payload) as Map<String, dynamic>?;
      if (json != null) {
        final status = Status.fromJSON(json);
        success = status.success;
        error = status.error;
      }
    }

    if (success == false) {
      close(pid: pid);
      error ??= 'An unknown error occurred';
      throw Exception(error);
    }
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

    _open(uuid, controller);

    return controller.stream
        .doOnError((_, __) {
          close(pid: uuid);
        })
        .first
        .then((value) {
          close(pid: uuid);
          _add(value);
        });
  }

  void _open(
    String pid,
    StreamController<IPCResponse?> controller,
  ) =>
      _controllers.putIfAbsent(pid, () => controller);

  void close({String? pid}) {
    if (_controllers.isEmpty) {
      assert(
        _subscriptions.isEmpty == true,
        'Internal _subscriptions is not empty on close but no controller found',
      );
      if (_stream.isClosed == false) {
        _stream.close();
      }
      return;
    }

    if (pid != null) {
      final controller = _controllers[pid];
      if (controller != null) {
        _detachSubscription(controller);
        controller.close();
        _controllers.remove(pid);
      }
      return;
    }

    _controllers
      ..forEach((_, controller) {
        _detachSubscription(controller);
        controller.close();
      })
      ..clear();

    assert(
      _subscriptions.isEmpty == true,
      'Internal _subscriptions is not empty on close',
    );

    if (_stream.isClosed == false) {
      _stream.close();
    }
  }

  void _attachSubscription(
    StreamController<IPCResponse?> controller,
    StreamSubscription<IPCResponse?> subscription,
  ) =>
      _subscriptions.putIfAbsent(controller, () => subscription);

  void _detachSubscription(
    StreamController<IPCResponse?> controller,
  ) {
    final subscription = _subscriptions[controller];

    if (subscription != null) {
      subscription.cancel();
      _subscriptions.remove(controller);
    }
  }

  bool get isClosed => _stream.isClosed;
}
