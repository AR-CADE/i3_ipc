part of 'i3_client_bloc.dart';

class I3ClientBlocState extends Equatable {
  const I3ClientBlocState._({
    this.status = '',
    this.pid,
    this.response,
  });

  const I3ClientBlocState.unknown()
      : this._(
          status: 'unknown',
        );

  const I3ClientBlocState.close(String pid)
      : this._(
          pid: pid,
          status: 'close',
        );

  I3ClientBlocState.barConfig(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          status: 'barConfig',
        );

  I3ClientBlocState.bindingModes(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          status: 'bindingModes',
        );

  I3ClientBlocState.bindingState(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          status: 'bindingState',
        );

  I3ClientBlocState.config(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          status: 'config',
        );

  I3ClientBlocState.inputs(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          status: 'inputs',
        );

  I3ClientBlocState.marks(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          status: 'marks',
        );

  I3ClientBlocState.outputs(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          status: 'outputs',
        );

  I3ClientBlocState.seats(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          status: 'seats',
        );

  I3ClientBlocState.tree(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          status: 'tree',
        );

  I3ClientBlocState.version(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          status: 'version',
        );

  I3ClientBlocState.workspaces(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          status: 'workspaces',
        );

  I3ClientBlocState.events(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          status: 'events',
        );

  I3ClientBlocState.command(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          status: 'command',
        );

  I3ClientBlocState.tick(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          status: 'tick',
        );

  I3ClientBlocState.sync(IPCResponse? response)
      : this._(
          pid: response?.pid,
          response: response,
          status: 'sync',
        );

  final IPCResponse? response;
  final String status;
  final String? pid;

  @override
  List<Object> get props => [pid ?? status];
}
