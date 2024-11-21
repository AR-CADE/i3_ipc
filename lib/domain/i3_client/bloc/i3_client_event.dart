part of 'i3_client_bloc.dart';

sealed class I3ClientBlocEvent extends Equatable {
  const I3ClientBlocEvent();
}

final class _I3IpcStatusChanged extends I3ClientBlocEvent {
  const _I3IpcStatusChanged(this.status);

  final IPCResponse? status;

  @override
  List<dynamic> get props => [status];
}

final class I3IpcGetBarConfigRequested extends I3ClientBlocEvent {
  const I3IpcGetBarConfigRequested({this.payload = '', this.socketPath});
  final String payload;
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcGetBindingModesRequested extends I3ClientBlocEvent {
  const I3IpcGetBindingModesRequested({this.payload = '', this.socketPath});
  final String payload;
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcGetBindingStateRequested extends I3ClientBlocEvent {
  const I3IpcGetBindingStateRequested({this.payload = '', this.socketPath});
  final String payload;
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcGetConfigRequested extends I3ClientBlocEvent {
  const I3IpcGetConfigRequested({this.payload = '', this.socketPath});
  final String payload;
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcGetInputsRequested extends I3ClientBlocEvent {
  const I3IpcGetInputsRequested({this.payload = '', this.socketPath});
  final String payload;
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcGetMarksRequested extends I3ClientBlocEvent {
  const I3IpcGetMarksRequested({this.payload = '', this.socketPath});
  final String payload;
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcGetOutputsRequested extends I3ClientBlocEvent {
  const I3IpcGetOutputsRequested({this.payload = '', this.socketPath});
  final String payload;
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcGetSeatsRequested extends I3ClientBlocEvent {
  const I3IpcGetSeatsRequested({this.payload = '', this.socketPath});
  final String payload;
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcGetTreeRequested extends I3ClientBlocEvent {
  const I3IpcGetTreeRequested({this.payload = '', this.socketPath});
  final String payload;
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcGetVersionRequested extends I3ClientBlocEvent {
  const I3IpcGetVersionRequested({this.payload = '', this.socketPath});
  final String payload;
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcGetWorkspacesRequested extends I3ClientBlocEvent {
  const I3IpcGetWorkspacesRequested({this.payload = '', this.socketPath});
  final String payload;
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcSubscribeEventsRequested extends I3ClientBlocEvent {
  const I3IpcSubscribeEventsRequested({this.payload = '', this.socketPath});

  final String payload;
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcExecuteRequested extends I3ClientBlocEvent {
  const I3IpcExecuteRequested({
    required this.type,
    this.payload = '',
    this.socketPath,
  });

  final int type;
  final String payload;
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcCommandRequested extends I3ClientBlocEvent {
  const I3IpcCommandRequested({this.payload = '', this.socketPath});

  final String payload;
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcSendTickRequested extends I3ClientBlocEvent {
  const I3IpcSendTickRequested({this.payload = '', this.socketPath});

  final String payload;
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcSyncRequested extends I3ClientBlocEvent {
  const I3IpcSyncRequested({this.payload = '', this.socketPath});

  final String payload;
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcCloseRequested extends I3ClientBlocEvent {
  const I3IpcCloseRequested(this.pid);

  final String pid;

  @override
  List<dynamic> get props => [pid];
}
