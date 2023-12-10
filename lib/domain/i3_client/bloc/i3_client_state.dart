part of 'i3_client_bloc.dart';

class I3ClientBlocState extends Equatable {
  const I3ClientBlocState._({
    this.id = '',
    this.pid,
    this.response,
  });

  const I3ClientBlocState.unknown() : this._();
  const I3ClientBlocState.close(String pid) : this._(pid: pid);

  I3ClientBlocState.barConfig(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          id: const Uuid().v4(),
        );

  I3ClientBlocState.bindingModes(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          id: const Uuid().v4(),
        );

  I3ClientBlocState.bindingState(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          id: const Uuid().v4(),
        );

  I3ClientBlocState.config(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          id: const Uuid().v4(),
        );

  I3ClientBlocState.inputs(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          id: const Uuid().v4(),
        );

  I3ClientBlocState.marks(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          id: const Uuid().v4(),
        );

  I3ClientBlocState.outputs(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          id: const Uuid().v4(),
        );

  I3ClientBlocState.seats(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          id: const Uuid().v4(),
        );

  I3ClientBlocState.tree(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          id: const Uuid().v4(),
        );

  I3ClientBlocState.version(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          id: const Uuid().v4(),
        );

  I3ClientBlocState.workspaces(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          id: const Uuid().v4(),
        );

  I3ClientBlocState.events(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          id: const Uuid().v4(),
        );

  I3ClientBlocState.command(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          id: const Uuid().v4(),
        );

  I3ClientBlocState.tick(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          id: const Uuid().v4(),
        );

  I3ClientBlocState.sync(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          id: const Uuid().v4(),
        );

  final IPCResponse? response;
  final String id;
  final String? pid;

  @override
  List<Object> get props => [id];
}
