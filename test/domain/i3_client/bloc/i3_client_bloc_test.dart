import 'package:bloc_test/bloc_test.dart';
import 'package:i3_ipc/i3_ipc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rxdart/subjects.dart';
import 'package:test/test.dart';

import '../../../core/test.dart';

void main() {
  late MockI3IpcCommandRepository i3CommandRepository;

  setUp(() {
    i3CommandRepository = MockI3IpcCommandRepository();
    when(
      () => i3CommandRepository.stream,
    ).thenAnswer(
      (_) => PublishSubject<IPCResponse?>(),
    );
  });

  group('I3ClientBloc', () {
    test('initial state is I3ClientBlocState.unknown', () {
      final i3ClientBloc = I3ClientBloc(
        i3CommandRepository: i3CommandRepository,
      );
      expect(
        i3ClientBloc.state,
        const I3ClientBlocState.unknown(),
      );
      i3ClientBloc.close();
    });

    group('I3IpcGetBarConfigRequested', () {
      blocTest<I3ClientBloc, I3ClientBlocState>(
        'calls getBarConfig on i3CommandRepository '
        'when I3IpcGetBarConfigRequested is added',
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        act: (bloc) => bloc.add(const I3IpcGetBarConfigRequested()),
        verify: (_) {
          verify(() => i3CommandRepository.getBarConfig()).called(1);
        },
      );
    });

    group('I3IpcGetBindingStateRequested', () {
      blocTest<I3ClientBloc, I3ClientBlocState>(
        'calls getBindingState on i3CommandRepository '
        'when I3IpcGetBindingStateRequested is added',
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        act: (bloc) => bloc.add(const I3IpcGetBindingStateRequested()),
        verify: (_) {
          verify(() => i3CommandRepository.getBindingState()).called(1);
        },
      );
    });

    group('I3IpcGetBindingStateRequested', () {
      blocTest<I3ClientBloc, I3ClientBlocState>(
        'calls getBindingState on i3CommandRepository '
        'when I3IpcGetBindingStateRequested is added',
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        act: (bloc) => bloc.add(const I3IpcGetBindingStateRequested()),
        verify: (_) {
          verify(() => i3CommandRepository.getBindingState()).called(1);
        },
      );
    });

    group('I3IpcGetConfigRequested', () {
      blocTest<I3ClientBloc, I3ClientBlocState>(
        'calls getConfig on i3CommandRepository '
        'when I3IpcGetConfigRequested is added',
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        act: (bloc) => bloc.add(const I3IpcGetConfigRequested()),
        verify: (_) {
          verify(() => i3CommandRepository.getConfig()).called(1);
        },
      );
    });

    group('I3IpcGetInputsRequested', () {
      blocTest<I3ClientBloc, I3ClientBlocState>(
        'calls getInputs on i3CommandRepository '
        'when I3IpcGetInputsRequested is added',
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        act: (bloc) => bloc.add(const I3IpcGetInputsRequested()),
        verify: (_) {
          verify(() => i3CommandRepository.getInputs()).called(1);
        },
      );
    });

    group('I3IpcGetMarksRequested', () {
      blocTest<I3ClientBloc, I3ClientBlocState>(
        'calls getMarks on i3CommandRepository '
        'when I3IpcGetMarksRequested is added',
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        act: (bloc) => bloc.add(const I3IpcGetMarksRequested()),
        verify: (_) {
          verify(() => i3CommandRepository.getMarks()).called(1);
        },
      );
    });

    group('I3IpcGetOutputsRequested', () {
      blocTest<I3ClientBloc, I3ClientBlocState>(
        'calls getOutputs on i3CommandRepository '
        'when I3IpcGetOutputsRequested is added',
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        act: (bloc) => bloc.add(const I3IpcGetOutputsRequested()),
        verify: (_) {
          verify(() => i3CommandRepository.getOutputs()).called(1);
        },
      );
    });

    group('I3IpcGetSeatsRequested', () {
      blocTest<I3ClientBloc, I3ClientBlocState>(
        'calls getSeats on i3CommandRepository '
        'when I3IpcGetSeatsRequested is added',
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        act: (bloc) => bloc.add(const I3IpcGetSeatsRequested()),
        verify: (_) {
          verify(() => i3CommandRepository.getSeats()).called(1);
        },
      );
    });

    group('I3IpcGetTreeRequested', () {
      blocTest<I3ClientBloc, I3ClientBlocState>(
        'calls getTree on i3CommandRepository '
        'when I3IpcGetTreeRequested is added',
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        act: (bloc) => bloc.add(const I3IpcGetTreeRequested()),
        verify: (_) {
          verify(() => i3CommandRepository.getTree()).called(1);
        },
      );
    });

    group('I3IpcGetVersionRequested', () {
      blocTest<I3ClientBloc, I3ClientBlocState>(
        'calls getVersion on i3CommandRepository '
        'when I3IpcGetVersionRequested is added',
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        act: (bloc) => bloc.add(const I3IpcGetVersionRequested()),
        verify: (_) {
          verify(() => i3CommandRepository.getVersion()).called(1);
        },
      );
    });

    group('I3IpcGetWorkspacesRequested', () {
      blocTest<I3ClientBloc, I3ClientBlocState>(
        'calls getWorkspaces on i3CommandRepository '
        'when I3IpcGetWorkspacesRequested is added',
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        act: (bloc) => bloc.add(const I3IpcGetWorkspacesRequested()),
        verify: (_) {
          verify(() => i3CommandRepository.getWorkspaces()).called(1);
        },
      );
    });

    group('I3IpcSubscribeEventsRequested', () {
      blocTest<I3ClientBloc, I3ClientBlocState>(
        'calls subscribeEvents on i3CommandRepository '
        'when I3IpcSubscribeEventsRequested is added',
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        act: (bloc) =>
            bloc.add(const I3IpcSubscribeEventsRequested(payload: 'payload')),
        verify: (_) {
          verify(() => i3CommandRepository.subscribeEvents(payload: 'payload'))
              .called(1);
        },
      );
    });

    group('I3IpcExecuteRequested', () {
      blocTest<I3ClientBloc, I3ClientBlocState>(
        'calls execute on i3CommandRepository '
        'when I3IpcExecuteRequested is added',
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        act: (bloc) =>
            bloc.add(const I3IpcExecuteRequested(type: 0, payload: 'payload')),
        verify: (_) {
          verify(() => i3CommandRepository.execute(0, payload: 'payload'))
              .called(1);
        },
      );

      blocTest<I3ClientBloc, I3ClientBlocState>(
        'calls subscribeEvents on i3CommandRepository '
        'when I3IpcExecuteRequested is added '
        'and type is IpcPayloadType.ipcSubscribe',
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        act: (bloc) => bloc.add(
          const I3IpcExecuteRequested(
            type: IpcPayloadType.ipcSubscribe,
            payload: 'payload',
          ),
        ),
        verify: (_) {
          verify(() => i3CommandRepository.subscribeEvents(payload: 'payload'))
              .called(1);
        },
      );
    });

    group('I3IpcCloseRequested', () {
      blocTest<I3ClientBloc, I3ClientBlocState>(
        'calls getWorkspaces on i3CommandRepository '
        'when I3IpcCloseRequested is added',
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        act: (bloc) => bloc.add(const I3IpcCloseRequested('pid')),
        verify: (_) {
          verify(() => i3CommandRepository.close(pid: 'pid')).called(1);
        },
      );
    });
  });
}
