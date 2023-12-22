import 'package:bloc_test/bloc_test.dart';
import 'package:i3_ipc/i3_ipc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../core/test.dart';

void main() {
  late MockI3IpcCommandRepository i3CommandRepository;

  setUp(() {
    i3CommandRepository = MockI3IpcCommandRepository();
    when(
      () => i3CommandRepository.stream,
    ).thenAnswer(
      (_) => Stream.value(
        null,
      ),
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

    blocTest<I3ClientBloc, I3ClientBlocState>(
      'emits [unknown] when response is null',
      setUp: () {
        when(() => i3CommandRepository.stream).thenAnswer(
          (_) => Stream.value(
            null,
          ),
        );
      },
      build: () => I3ClientBloc(
        i3CommandRepository: i3CommandRepository,
      ),
      expect: () => const <I3ClientBlocState>[
        I3ClientBlocState.unknown(),
      ],
    );

    blocTest<I3ClientBloc, I3ClientBlocState>(
      'emits [command] when reponse type is IpcPayloadType.ipcCommand',
      setUp: () {
        when(() => i3CommandRepository.stream).thenAnswer(
          (_) => Stream.value(
            IPCResponse(
              type: IpcPayloadType.ipcCommand,
            ),
          ),
        );
      },
      build: () => I3ClientBloc(
        i3CommandRepository: i3CommandRepository,
      ),
      expect: () => <I3ClientBlocState>[
        I3ClientBlocState.command(null),
      ],
    );

    blocTest<I3ClientBloc, I3ClientBlocState>(
      'emits [barConfig] when reponse type is IpcPayloadType.ipcGetBarConfig',
      setUp: () {
        when(() => i3CommandRepository.stream).thenAnswer(
          (_) => Stream.value(
            IPCResponse(
              type: IpcPayloadType.ipcGetBarConfig,
            ),
          ),
        );
      },
      build: () => I3ClientBloc(
        i3CommandRepository: i3CommandRepository,
      ),
      expect: () => <I3ClientBlocState>[
        I3ClientBlocState.barConfig(null),
      ],
    );

    blocTest<I3ClientBloc, I3ClientBlocState>(
      'emits [bindingModes] when reponse type '
      'is IpcPayloadType.ipcGetBindingModes',
      setUp: () {
        when(() => i3CommandRepository.stream).thenAnswer(
          (_) => Stream.value(
            IPCResponse(
              type: IpcPayloadType.ipcGetBindingModes,
            ),
          ),
        );
      },
      build: () => I3ClientBloc(
        i3CommandRepository: i3CommandRepository,
      ),
      expect: () => <I3ClientBlocState>[
        I3ClientBlocState.bindingModes(null),
      ],
    );

    blocTest<I3ClientBloc, I3ClientBlocState>(
      'emits [bindingState] when reponse type '
      'is IpcPayloadType.ipcGetBindingState',
      setUp: () {
        when(() => i3CommandRepository.stream).thenAnswer(
          (_) => Stream.value(
            IPCResponse(
              type: IpcPayloadType.ipcGetBindingState,
            ),
          ),
        );
      },
      build: () => I3ClientBloc(
        i3CommandRepository: i3CommandRepository,
      ),
      expect: () => <I3ClientBlocState>[
        I3ClientBlocState.bindingState(null),
      ],
    );

    blocTest<I3ClientBloc, I3ClientBlocState>(
      'emits [config] when reponse type '
      'is IpcPayloadType.ipcGetConfig',
      setUp: () {
        when(() => i3CommandRepository.stream).thenAnswer(
          (_) => Stream.value(
            IPCResponse(
              type: IpcPayloadType.ipcGetConfig,
            ),
          ),
        );
      },
      build: () => I3ClientBloc(
        i3CommandRepository: i3CommandRepository,
      ),
      expect: () => <I3ClientBlocState>[
        I3ClientBlocState.config(null),
      ],
    );

    blocTest<I3ClientBloc, I3ClientBlocState>(
      'emits [inputs] when reponse type '
      'is IpcPayloadType.ipcGetInputs',
      setUp: () {
        when(() => i3CommandRepository.stream).thenAnswer(
          (_) => Stream.value(
            IPCResponse(
              type: IpcPayloadType.ipcGetInputs,
            ),
          ),
        );
      },
      build: () => I3ClientBloc(
        i3CommandRepository: i3CommandRepository,
      ),
      expect: () => <I3ClientBlocState>[
        I3ClientBlocState.inputs(null),
      ],
    );

    blocTest<I3ClientBloc, I3ClientBlocState>(
      'emits [marks] when reponse type '
      'is IpcPayloadType.ipcGetMarks',
      setUp: () {
        when(() => i3CommandRepository.stream).thenAnswer(
          (_) => Stream.value(
            IPCResponse(
              type: IpcPayloadType.ipcGetMarks,
            ),
          ),
        );
      },
      build: () => I3ClientBloc(
        i3CommandRepository: i3CommandRepository,
      ),
      expect: () => <I3ClientBlocState>[
        I3ClientBlocState.marks(null),
      ],
    );

    blocTest<I3ClientBloc, I3ClientBlocState>(
      'emits [outputs] when reponse type '
      'is IpcPayloadType.ipcGetOutputs',
      setUp: () {
        when(() => i3CommandRepository.stream).thenAnswer(
          (_) => Stream.value(
            IPCResponse(
              type: IpcPayloadType.ipcGetOutputs,
            ),
          ),
        );
      },
      build: () => I3ClientBloc(
        i3CommandRepository: i3CommandRepository,
      ),
      expect: () => <I3ClientBlocState>[
        I3ClientBlocState.outputs(null),
      ],
    );

    blocTest<I3ClientBloc, I3ClientBlocState>(
      'emits [seats] when reponse type '
      'is IpcPayloadType.ipcGetSeats',
      setUp: () {
        when(() => i3CommandRepository.stream).thenAnswer(
          (_) => Stream.value(
            IPCResponse(
              type: IpcPayloadType.ipcGetSeats,
            ),
          ),
        );
      },
      build: () => I3ClientBloc(
        i3CommandRepository: i3CommandRepository,
      ),
      expect: () => <I3ClientBlocState>[
        I3ClientBlocState.seats(null),
      ],
    );

    blocTest<I3ClientBloc, I3ClientBlocState>(
      'emits [tree] when reponse type '
      'is IpcPayloadType.ipcGetTree',
      setUp: () {
        when(() => i3CommandRepository.stream).thenAnswer(
          (_) => Stream.value(
            IPCResponse(
              type: IpcPayloadType.ipcGetTree,
            ),
          ),
        );
      },
      build: () => I3ClientBloc(
        i3CommandRepository: i3CommandRepository,
      ),
      expect: () => <I3ClientBlocState>[
        I3ClientBlocState.tree(null),
      ],
    );

    blocTest<I3ClientBloc, I3ClientBlocState>(
      'emits [version] when reponse type '
      'is IpcPayloadType.ipcGetVersion',
      setUp: () {
        when(() => i3CommandRepository.stream).thenAnswer(
          (_) => Stream.value(
            IPCResponse(
              type: IpcPayloadType.ipcGetVersion,
            ),
          ),
        );
      },
      build: () => I3ClientBloc(
        i3CommandRepository: i3CommandRepository,
      ),
      expect: () => <I3ClientBlocState>[
        I3ClientBlocState.version(null),
      ],
    );

    blocTest<I3ClientBloc, I3ClientBlocState>(
      'emits [workspaces] when reponse type '
      'is IpcPayloadType.ipcGetWorkspaces',
      setUp: () {
        when(() => i3CommandRepository.stream).thenAnswer(
          (_) => Stream.value(
            IPCResponse(
              type: IpcPayloadType.ipcGetWorkspaces,
            ),
          ),
        );
      },
      build: () => I3ClientBloc(
        i3CommandRepository: i3CommandRepository,
      ),
      expect: () => <I3ClientBlocState>[
        I3ClientBlocState.workspaces(null),
      ],
    );

    blocTest<I3ClientBloc, I3ClientBlocState>(
      'emits [tick] when reponse type '
      'is IpcPayloadType.ipcSendTick',
      setUp: () {
        when(() => i3CommandRepository.stream).thenAnswer(
          (_) => Stream.value(
            IPCResponse(
              type: IpcPayloadType.ipcSendTick,
            ),
          ),
        );
      },
      build: () => I3ClientBloc(
        i3CommandRepository: i3CommandRepository,
      ),
      expect: () => <I3ClientBlocState>[
        I3ClientBlocState.tick(null),
      ],
    );

    blocTest<I3ClientBloc, I3ClientBlocState>(
      'emits [sync] when reponse type '
      'is IpcPayloadType.ipcSync',
      setUp: () {
        when(() => i3CommandRepository.stream).thenAnswer(
          (_) => Stream.value(
            IPCResponse(
              type: IpcPayloadType.ipcSync,
            ),
          ),
        );
      },
      build: () => I3ClientBloc(
        i3CommandRepository: i3CommandRepository,
      ),
      expect: () => <I3ClientBlocState>[
        I3ClientBlocState.sync(null),
      ],
    );

    group('events', () {
      blocTest<I3ClientBloc, I3ClientBlocState>(
        'emits [events] when reponse type '
        'is IPCEventType.ipcI3EventTypeBinding',
        setUp: () {
          when(() => i3CommandRepository.stream).thenAnswer(
            (_) => Stream.value(
              IPCResponse(
                type: IPCEventType.ipcI3EventTypeBinding,
              ),
            ),
          );
        },
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        expect: () => <I3ClientBlocState>[
          I3ClientBlocState.events(null),
        ],
      );

      blocTest<I3ClientBloc, I3ClientBlocState>(
        'emits [events] when reponse type '
        'is IPCEventType.ipcI3EventTypeMode',
        setUp: () {
          when(() => i3CommandRepository.stream).thenAnswer(
            (_) => Stream.value(
              IPCResponse(
                type: IPCEventType.ipcI3EventTypeMode,
              ),
            ),
          );
        },
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        expect: () => <I3ClientBlocState>[
          I3ClientBlocState.events(null),
        ],
      );

      blocTest<I3ClientBloc, I3ClientBlocState>(
        'emits [events] when reponse type '
        'is IPCEventType.ipcI3EventTypeMode',
        setUp: () {
          when(() => i3CommandRepository.stream).thenAnswer(
            (_) => Stream.value(
              IPCResponse(
                type: IPCEventType.ipcI3EventTypeOutput,
              ),
            ),
          );
        },
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        expect: () => <I3ClientBlocState>[
          I3ClientBlocState.events(null),
        ],
      );

      blocTest<I3ClientBloc, I3ClientBlocState>(
        'emits [events] when reponse type '
        'is IPCEventType.ipcI3EventTypeShutdown',
        setUp: () {
          when(() => i3CommandRepository.stream).thenAnswer(
            (_) => Stream.value(
              IPCResponse(
                type: IPCEventType.ipcI3EventTypeShutdown,
              ),
            ),
          );
        },
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        expect: () => <I3ClientBlocState>[
          I3ClientBlocState.events(null),
        ],
      );

      blocTest<I3ClientBloc, I3ClientBlocState>(
        'emits [events] when reponse type '
        'is IPCEventType.ipcI3EventTypeTick',
        setUp: () {
          when(() => i3CommandRepository.stream).thenAnswer(
            (_) => Stream.value(
              IPCResponse(
                type: IPCEventType.ipcI3EventTypeTick,
              ),
            ),
          );
        },
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        expect: () => <I3ClientBlocState>[
          I3ClientBlocState.events(null),
        ],
      );

      blocTest<I3ClientBloc, I3ClientBlocState>(
        'emits [events] when reponse type '
        'is IPCEventType.ipcI3EventTypeWindow',
        setUp: () {
          when(() => i3CommandRepository.stream).thenAnswer(
            (_) => Stream.value(
              IPCResponse(
                type: IPCEventType.ipcI3EventTypeWindow,
              ),
            ),
          );
        },
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        expect: () => <I3ClientBlocState>[
          I3ClientBlocState.events(null),
        ],
      );

      blocTest<I3ClientBloc, I3ClientBlocState>(
        'emits [events] when reponse type '
        'is IPCEventType.ipcI3EventTypeWorkspace',
        setUp: () {
          when(() => i3CommandRepository.stream).thenAnswer(
            (_) => Stream.value(
              IPCResponse(
                type: IPCEventType.ipcI3EventTypeWorkspace,
              ),
            ),
          );
        },
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        expect: () => <I3ClientBlocState>[
          I3ClientBlocState.events(null),
        ],
      );

      blocTest<I3ClientBloc, I3ClientBlocState>(
        'emits [events] when reponse type '
        'is IPCEventType.ipcSwayEventTypeInput',
        setUp: () {
          when(() => i3CommandRepository.stream).thenAnswer(
            (_) => Stream.value(
              IPCResponse(
                type: IPCEventType.ipcSwayEventTypeInput,
              ),
            ),
          );
        },
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        expect: () => <I3ClientBlocState>[
          I3ClientBlocState.events(null),
        ],
      );
    });

    group('I3IpcCommandRequested', () {
      blocTest<I3ClientBloc, I3ClientBlocState>(
        'calls command on i3CommandRepository '
        'when I3IpcCommandRequested is added',
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        act: (bloc) =>
            bloc.add(const I3IpcCommandRequested(payload: 'payload')),
        verify: (_) {
          verify(() => i3CommandRepository.command(payload: 'payload'))
              .called(1);
        },
      );
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

    group('I3IpcGetBindingModesRequested', () {
      blocTest<I3ClientBloc, I3ClientBlocState>(
        'calls getBindingModes on i3CommandRepository '
        'when I3IpcGetBindingModesRequested is added',
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        act: (bloc) => bloc.add(const I3IpcGetBindingModesRequested()),
        verify: (_) {
          verify(() => i3CommandRepository.getBindingModes()).called(1);
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

    group('I3IpcSendTickRequested', () {
      blocTest<I3ClientBloc, I3ClientBlocState>(
        'calls sendTick on i3CommandRepository '
        'when I3IpcSendTickRequested is added',
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        act: (bloc) =>
            bloc.add(const I3IpcSendTickRequested(payload: 'payload')),
        verify: (_) {
          verify(() => i3CommandRepository.sendTick(payload: 'payload'))
              .called(1);
        },
      );
    });

    group('I3IpcSyncRequested', () {
      blocTest<I3ClientBloc, I3ClientBlocState>(
        'calls sync on i3CommandRepository '
        'when I3IpcSyncRequested is added',
        build: () => I3ClientBloc(
          i3CommandRepository: i3CommandRepository,
        ),
        act: (bloc) => bloc.add(const I3IpcSyncRequested(payload: 'payload')),
        verify: (_) {
          verify(() => i3CommandRepository.sync(payload: 'payload')).called(1);
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
