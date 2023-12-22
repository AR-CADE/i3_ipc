import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:i3_ipc/core/tools/ipc_event_type.dart';
import 'package:i3_ipc/core/tools/ipc_payload_type.dart';
import 'package:i3_ipc/data/models/ipc_response.dart';
import 'package:i3_ipc/data/repositories/ipc_command/ipc_command_repository.dart';

part 'i3_client_event.dart';
part 'i3_client_state.dart';

class I3ClientBloc extends Bloc<I3ClientBlocEvent, I3ClientBlocState> {
  I3ClientBloc({
    required I3IpcCommandRepository i3CommandRepository,
  })  : _i3CommandRepository = i3CommandRepository,
        super(const I3ClientBlocState.unknown()) {
    on<I3IpcGetBarConfigRequested>(_onI3IpcGetBarConfigRequested);
    on<I3IpcGetBindingModesRequested>(_onI3IpcGetBindingModesRequested);
    on<I3IpcGetBindingStateRequested>(_onI3IpcGetBindingStateRequested);
    on<I3IpcGetConfigRequested>(_onI3IpcGetConfigRequested);
    on<I3IpcGetInputsRequested>(_onI3IpcGetInputsRequested);
    on<I3IpcGetMarksRequested>(_onI3IpcGetMarksRequested);
    on<I3IpcGetOutputsRequested>(_onI3IpcGetOutputsRequested);
    on<I3IpcGetSeatsRequested>(_onI3IpcGetSeatsRequested);
    on<I3IpcGetTreeRequested>(_onI3IpcGetTreeRequested);
    on<I3IpcGetVersionRequested>(_onI3IpcGetVersionRequested);
    on<I3IpcGetWorkspacesRequested>(_onI3IpcGetWorkspacesRequested);
    on<I3IpcSubscribeEventsRequested>(_onI3IpcSubscribeEventsRequested);
    on<I3IpcCloseRequested>(_onI3IpcCloseRequested);
    on<_I3IpcStatusChanged>(_onI3IpcStatusChanged);
    on<I3IpcExecuteRequested>(_onI3IpcExecuteRequested);
    on<I3IpcCommandRequested>(_onI3IpcCommandRequested);
    on<I3IpcSendTickRequested>(_onI3IpcSendTickRequested);
    on<I3IpcSyncRequested>(_onI3IpcSyncRequested);

    _i3CommandStatusSubscription = _i3CommandRepository.stream.listen(
      (status) => add(_I3IpcStatusChanged(status)),
    );
  }

  late final StreamSubscription<IPCResponse?> _i3CommandStatusSubscription;

  final I3IpcCommandRepository _i3CommandRepository;

  @override
  Future<void> close() {
    _i3CommandStatusSubscription.cancel();
    return super.close();
  }

  Future<void> _onI3IpcStatusChanged(
    _I3IpcStatusChanged event,
    Emitter<I3ClientBlocState> emit,
  ) async {
    final response = event.status;
    if (response == null) {
      return emit(const I3ClientBlocState.unknown());
    }

    switch (response.type) {
      case IpcPayloadType.ipcCommand:
        return emit(I3ClientBlocState.command(response));
      case IpcPayloadType.ipcGetBarConfig:
        return emit(I3ClientBlocState.barConfig(response));
      case IpcPayloadType.ipcGetBindingModes:
        return emit(I3ClientBlocState.bindingModes(response));
      case IpcPayloadType.ipcGetBindingState:
        return emit(I3ClientBlocState.bindingState(response));
      case IpcPayloadType.ipcGetConfig:
        return emit(I3ClientBlocState.config(response));
      case IpcPayloadType.ipcGetInputs:
        return emit(I3ClientBlocState.inputs(response));
      case IpcPayloadType.ipcGetMarks:
        return emit(I3ClientBlocState.marks(response));
      case IpcPayloadType.ipcGetOutputs:
        return emit(I3ClientBlocState.outputs(response));
      case IpcPayloadType.ipcGetSeats:
        return emit(I3ClientBlocState.seats(response));
      case IpcPayloadType.ipcGetTree:
        return emit(I3ClientBlocState.tree(response));
      case IpcPayloadType.ipcGetVersion:
        return emit(I3ClientBlocState.version(response));
      case IpcPayloadType.ipcGetWorkspaces:
        return emit(I3ClientBlocState.workspaces(response));
      case IpcPayloadType.ipcSendTick:
        return emit(I3ClientBlocState.tick(response));
      case IpcPayloadType.ipcSync:
        return emit(I3ClientBlocState.sync(response));
      default:
        {
          if (response.type == IPCEventType.ipcI3EventTypeBinding ||
              response.type == IPCEventType.ipcI3EventTypeMode ||
              response.type == IPCEventType.ipcI3EventTypeOutput ||
              response.type == IPCEventType.ipcI3EventTypeShutdown ||
              response.type == IPCEventType.ipcI3EventTypeTick ||
              response.type == IPCEventType.ipcI3EventTypeWindow ||
              response.type == IPCEventType.ipcI3EventTypeWorkspace ||
              response.type == IPCEventType.ipcSwayEventTypeInput) {
            emit(I3ClientBlocState.events(response));
          }
        }
    }
  }

  Future<void> _onI3IpcCommandRequested(
    I3IpcCommandRequested event,
    Emitter<I3ClientBlocState> emit,
  ) async {
    return _i3CommandRepository.command(
      payload: event.payload,
      socketPath: event.socketPath,
    );
  }

  Future<void> _onI3IpcGetBarConfigRequested(
    I3IpcGetBarConfigRequested event,
    Emitter<I3ClientBlocState> emit,
  ) async {
    return _i3CommandRepository.getBarConfig(
      payload: event.payload,
      socketPath: event.socketPath,
    );
  }

  Future<void> _onI3IpcGetBindingModesRequested(
    I3IpcGetBindingModesRequested event,
    Emitter<I3ClientBlocState> emit,
  ) async {
    return _i3CommandRepository.getBindingModes(
      payload: event.payload,
      socketPath: event.socketPath,
    );
  }

  Future<void> _onI3IpcGetBindingStateRequested(
    I3IpcGetBindingStateRequested event,
    Emitter<I3ClientBlocState> emit,
  ) async {
    return _i3CommandRepository.getBindingState(
      payload: event.payload,
      socketPath: event.socketPath,
    );
  }

  Future<void> _onI3IpcGetConfigRequested(
    I3IpcGetConfigRequested event,
    Emitter<I3ClientBlocState> emit,
  ) async {
    return _i3CommandRepository.getConfig(
      payload: event.payload,
      socketPath: event.socketPath,
    );
  }

  Future<void> _onI3IpcGetInputsRequested(
    I3IpcGetInputsRequested event,
    Emitter<I3ClientBlocState> emit,
  ) async {
    return _i3CommandRepository.getInputs(
      payload: event.payload,
      socketPath: event.socketPath,
    );
  }

  Future<void> _onI3IpcGetMarksRequested(
    I3IpcGetMarksRequested event,
    Emitter<I3ClientBlocState> emit,
  ) async {
    return await _i3CommandRepository.getMarks(
      payload: event.payload,
      socketPath: event.socketPath,
    );
  }

  Future<void> _onI3IpcGetOutputsRequested(
    I3IpcGetOutputsRequested event,
    Emitter<I3ClientBlocState> emit,
  ) async {
    return _i3CommandRepository.getOutputs(
      payload: event.payload,
      socketPath: event.socketPath,
    );
  }

  Future<void> _onI3IpcGetSeatsRequested(
    I3IpcGetSeatsRequested event,
    Emitter<I3ClientBlocState> emit,
  ) async {
    return _i3CommandRepository.getSeats(
      payload: event.payload,
      socketPath: event.socketPath,
    );
  }

  Future<void> _onI3IpcGetTreeRequested(
    I3IpcGetTreeRequested event,
    Emitter<I3ClientBlocState> emit,
  ) async {
    return _i3CommandRepository.getTree(
      payload: event.payload,
      socketPath: event.socketPath,
    );
  }

  Future<void> _onI3IpcGetVersionRequested(
    I3IpcGetVersionRequested event,
    Emitter<I3ClientBlocState> emit,
  ) async {
    return _i3CommandRepository.getVersion(
      payload: event.payload,
      socketPath: event.socketPath,
    );
  }

  Future<void> _onI3IpcGetWorkspacesRequested(
    I3IpcGetWorkspacesRequested event,
    Emitter<I3ClientBlocState> emit,
  ) async {
    return _i3CommandRepository.getWorkspaces(
      payload: event.payload,
      socketPath: event.socketPath,
    );
  }

  Future<void> _onI3IpcSubscribeEventsRequested(
    I3IpcSubscribeEventsRequested event,
    Emitter<I3ClientBlocState> emit,
  ) async {
    return _i3CommandRepository.subscribeEvents(
      payload: event.payload,
      socketPath: event.socketPath,
    );
  }

  Future<void> _onI3IpcSendTickRequested(
    I3IpcSendTickRequested event,
    Emitter<I3ClientBlocState> emit,
  ) async {
    return _i3CommandRepository.sendTick(
      payload: event.payload,
      socketPath: event.socketPath,
    );
  }

  Future<void> _onI3IpcSyncRequested(
    I3IpcSyncRequested event,
    Emitter<I3ClientBlocState> emit,
  ) async {
    return _i3CommandRepository.sync(
      payload: event.payload,
      socketPath: event.socketPath,
    );
  }

  Future<void> _onI3IpcExecuteRequested(
    I3IpcExecuteRequested event,
    Emitter<I3ClientBlocState> emit,
  ) async {
    if (event.type == IpcPayloadType.ipcSubscribe) {
      return add(
        I3IpcSubscribeEventsRequested(
          payload: event.payload,
          socketPath: event.socketPath,
        ),
      );
    }
    return _i3CommandRepository.execute(
      event.type,
      payload: event.payload,
      socketPath: event.socketPath,
    );
  }

  void _onI3IpcCloseRequested(
    I3IpcCloseRequested event,
    Emitter<I3ClientBlocState> emit,
  ) {
    _i3CommandRepository.close(pid: event.pid);
    return emit(I3ClientBlocState.close(event.pid));
  }
}
