import 'dart:async';
import 'dart:typed_data';

import 'package:i3_ipc/api/ipc_client_api.dart';
import 'package:i3_ipc/api/socket_api.dart';
import 'package:i3_ipc/i3_ipc.dart';
import 'package:mocktail/mocktail.dart';

class MockI3IpcClientApi extends Mock implements I3IpcClientApi {}

class MockI3IpcClientNullResponseApi extends MockI3IpcClientApi {
  @override
  Future<void> execute(
    int type, {
    required String pid,
    String payload = '',
    StreamController<IPCResponse?>? controller,
    Endian? endian,
    String? socketPath,
    Duration timeout = const Duration(seconds: 2),
    I3IpcSocketApi socket = const I3IpcSocketApi(),
  }) async {
    return controller?.add(
      null,
    );
  }
}

class MockLibInput extends Mock implements LibInput {}

class MockInput extends Mock implements Input {}

class MockRect extends Mock implements Rect {}

class MockMode extends Mock implements Mode {}

class MockNode extends Mock implements Node {}

class MockIdleInhibitor extends Mock implements IdleInhibitor {}

class MockWindowProperties extends Mock implements WindowProperties {}

class MockI3IpcCommandRepository extends Mock
    implements I3IpcCommandRepository {}

class MockIPCResponse extends Mock implements IPCResponse {}

class MockI3IpcSocketApi extends Mock implements I3IpcSocketApi {}
