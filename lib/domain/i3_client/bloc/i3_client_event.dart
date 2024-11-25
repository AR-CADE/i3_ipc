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
  /// When sending without a [payload], this retrieves the list of
  /// configured bar IDs.
  ///
  ///
  /// Returns an array of bar IDs, which are strings.
  const I3IpcGetBarConfigRequested({this.payload = '', this.socketPath});

  /// The request payload (default: '')
  final String payload;

  /// The socket path (optional)
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcGetBindingModesRequested extends I3ClientBlocEvent {
  /// Retrieve the list of binding modes that currently configured.
  ///
  ///
  /// Returns an array of strings, with each string being
  /// the name of a binding mode. This will always contain at least
  /// one mode (currently default), which is the default binding mode.
  const I3IpcGetBindingModesRequested({this.payload = '', this.socketPath});

  /// The request payload (default: '')
  final String payload;

  /// The socket path (optional)
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcGetBindingStateRequested extends I3ClientBlocEvent {
  /// Returns the currently active binding mode.
  ///
  /// Returns a single object that contains the property name,
  /// which is set to the currently active binding mode as a string.
  const I3IpcGetBindingStateRequested({this.payload = '', this.socketPath});

  /// The request payload (default: '')
  final String payload;

  /// The socket path (optional)
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcGetConfigRequested extends I3ClientBlocEvent {
  /// Retrieve the contents of the config that was last loaded.
  ///
  /// Returns an object with a single string property containing
  /// the contents of the config.
  const I3IpcGetConfigRequested({this.payload = '', this.socketPath});

  /// The request payload (default: '')
  final String payload;

  /// The socket path (optional)
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcGetInputsRequested extends I3ClientBlocEvent {
  /// Retrieve a list of the input devices currently available.
  ///
  /// Returns an array of objects corresponding to
  /// each input device.
  const I3IpcGetInputsRequested({this.payload = '', this.socketPath});

  /// The request payload (default: '')
  final String payload;

  /// The socket path (optional)
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcGetMarksRequested extends I3ClientBlocEvent {
  /// Retrieve the currently set marks.
  ///
  /// Returns an array of marks current set. Since each mark
  /// can only be set for one container, this is a set so each value is
  /// unique and the order is undefined.

  const I3IpcGetMarksRequested({this.payload = '', this.socketPath});

  /// The request payload (default: '')
  final String payload;

  /// The socket path (optional)
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcGetOutputsRequested extends I3ClientBlocEvent {
  /// Retrieve the list of outputs.
  ///
  /// Returns an array of objects corresponding to each output.
  const I3IpcGetOutputsRequested({this.payload = '', this.socketPath});

  /// The request payload (default: '')
  final String payload;

  /// The socket path (optional)
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcGetSeatsRequested extends I3ClientBlocEvent {
  /// Retrieve a list of the seats currently configured.
  ///
  /// Returns an array of objects corresponding to each seat.
  /// There will always be at least one seat.
  const I3IpcGetSeatsRequested({this.payload = '', this.socketPath});

  /// The request payload (default: '')
  final String payload;

  /// The socket path (optional)
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcGetTreeRequested extends I3ClientBlocEvent {
  /// Retrieve a JSON representation of the tree.
  ///
  /// Returns an array of objects that represent the current tree.
  /// Each object represents one node.
  const I3IpcGetTreeRequested({this.payload = '', this.socketPath});

  /// The request payload (default: '')
  final String payload;

  /// The socket path (optional)
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcGetVersionRequested extends I3ClientBlocEvent {
  /// Retrieve version information about the server process.
  const I3IpcGetVersionRequested({this.payload = '', this.socketPath});

  /// The request payload (default: '')
  final String payload;

  /// The socket path (optional)
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcGetWorkspacesRequested extends I3ClientBlocEvent {
  /// Retrieves the list of workspaces.
  ///
  /// Returns an array of objects corresponding to each workspace.
  const I3IpcGetWorkspacesRequested({this.payload = '', this.socketPath});

  /// The request payload (default: '')
  final String payload;

  /// The socket path (optional)
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcSubscribeEventsRequested extends I3ClientBlocEvent {
  const I3IpcSubscribeEventsRequested({this.payload = '', this.socketPath});

  /// The request payload (default: '')
  final String payload;

  /// The socket path (optional)
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcExecuteRequested extends I3ClientBlocEvent {
  /// Execute a command based on the [type], the [payload] may or may not
  /// be used be the sever procces depending on the requested command [type].
  const I3IpcExecuteRequested({
    required this.type,
    this.payload = '',
    this.socketPath,
  });

  final int type;

  /// The request payload (default: '')
  final String payload;

  /// The socket path (optional)
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcCommandRequested extends I3ClientBlocEvent {
  /// Parses and runs the [payload] as sever commands.
  ///
  /// Returns an array of objects corresponding to each command
  /// that was parsed. Each object has the property success, which is a
  /// boolean indicating whether the command was successful.
  /// The object may also contain the properties error and parse_error.
  /// The error property is a human readable error message while
  /// parse_error is a boolean indicating whether the reason the command
  /// failed was because the command was unknown or not able to be parsed.
  const I3IpcCommandRequested({this.payload = '', this.socketPath});

  /// The request payload (default: '')
  final String payload;

  /// The socket path (optional)
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcSendTickRequested extends I3ClientBlocEvent {
  /// Issues a TICK event to all clients subscribing to the event to
  /// ensure that all events prior to the tick were received.
  /// If a [payload] is given, it will be included in the TICK event.
  ///
  ///
  /// Returns a single object contains the property success,
  /// which is a boolean value indicating whether the TICK event was sent.

  const I3IpcSendTickRequested({this.payload = '', this.socketPath});

  /// The request payload (default: '')
  final String payload;

  /// The socket path (optional)
  final String? socketPath;

  @override
  List<dynamic> get props => [payload, socketPath];
}

final class I3IpcSyncRequested extends I3ClientBlocEvent {
  /// On any wayland compositor, and for i3 compatibility,
  /// this command should just return a failure object since
  /// it does not make sense to implement in wayland due to the
  /// X11 nature of the command.
  /// If you are curious about what this IPC command does in i3,
  /// refer to the i3 documentation.
  ///
  ///
  /// Returns a single object that contains the property success,
  /// which is set to the boolean value false.
  const I3IpcSyncRequested({this.payload = '', this.socketPath});

  /// The request payload (default: '')
  final String payload;

  /// The socket path (optional)
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
