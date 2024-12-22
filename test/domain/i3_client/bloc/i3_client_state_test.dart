import 'package:i3_ipc/data/models/ipc_response.dart';
import 'package:i3_ipc/domain/i3_client/bloc/i3_client_bloc.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

void main() {
  group('I3ClientBlocState', () {
    group('I3ClientBlocState.unknown', () {
      test('supports value comparisons', () {
        expect(
          const I3ClientBlocState.unknown(),
          const I3ClientBlocState.unknown(),
        );
      });

      test('props are correct', () {
        expect(
          const I3ClientBlocState.unknown().props,
          equals(['unknown', 'unknown']),
        );
      });
    });

    group('I3ClientBlocState.close', () {
      test('supports value comparisons', () {
        expect(
          const I3ClientBlocState.close('pid'),
          const I3ClientBlocState.close('pid'),
        );
      });

      test('props are correct', () {
        expect(
          const I3ClientBlocState.close('pid').props,
          equals(['pid', 'close']),
        );
      });
    });

    group('I3ClientBlocState.barConfig', () {
      test('supports value comparisons', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());
        expect(
          I3ClientBlocState.barConfig(response),
          I3ClientBlocState.barConfig(response),
        );
      });

      test('props are correct', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());

        expect(
          I3ClientBlocState.barConfig(response).props,
          equals([response.id, 'barConfig']),
        );
      });
    });

    group('I3ClientBlocState.bindingModes', () {
      test('supports value comparisons', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());
        expect(
          I3ClientBlocState.bindingModes(response),
          I3ClientBlocState.bindingModes(response),
        );
      });

      test('props are correct', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());

        expect(
          I3ClientBlocState.bindingModes(response).props,
          equals([response.id, 'bindingModes']),
        );
      });
    });

    group('I3ClientBlocState.bindingState', () {
      test('supports value comparisons', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());
        expect(
          I3ClientBlocState.bindingState(response),
          I3ClientBlocState.bindingState(response),
        );
      });

      test('props are correct', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());

        expect(
          I3ClientBlocState.bindingState(response).props,
          equals([response.id, 'bindingState']),
        );
      });
    });

    group('I3ClientBlocState.command', () {
      test('supports value comparisons', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());
        expect(
          I3ClientBlocState.command(response),
          I3ClientBlocState.command(response),
        );
      });

      test('props are correct', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());

        expect(
          I3ClientBlocState.command(response).props,
          equals([response.id, 'command']),
        );
      });
    });

    group('I3ClientBlocState.config', () {
      test('supports value comparisons', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());
        expect(
          I3ClientBlocState.config(response),
          I3ClientBlocState.config(response),
        );
      });

      test('props are correct', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());

        expect(
          I3ClientBlocState.config(response).props,
          equals([response.id, 'config']),
        );
      });
    });

    group('I3ClientBlocState.events', () {
      test('supports value comparisons', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());
        expect(
          I3ClientBlocState.events(response),
          I3ClientBlocState.events(response),
        );
      });

      test('props are correct', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());

        expect(
          I3ClientBlocState.events(response).props,
          equals([response.id, 'events']),
        );
      });
    });

    group('I3ClientBlocState.inputs', () {
      test('supports value comparisons', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());
        expect(
          I3ClientBlocState.inputs(response),
          I3ClientBlocState.inputs(response),
        );
      });

      test('props are correct', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());

        expect(
          I3ClientBlocState.inputs(response).props,
          equals([response.id, 'inputs']),
        );
      });
    });

    group('I3ClientBlocState.marks', () {
      test('supports value comparisons', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());
        expect(
          I3ClientBlocState.marks(response),
          I3ClientBlocState.marks(response),
        );
      });

      test('props are correct', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());

        expect(
          I3ClientBlocState.marks(response).props,
          equals([response.id, 'marks']),
        );
      });
    });

    group('I3ClientBlocState.outputs', () {
      test('supports value comparisons', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());
        expect(
          I3ClientBlocState.outputs(response),
          I3ClientBlocState.outputs(response),
        );
      });

      test('props are correct', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());

        expect(
          I3ClientBlocState.outputs(response).props,
          equals([response.id, 'outputs']),
        );
      });
    });

    group('I3ClientBlocState.seats', () {
      test('supports value comparisons', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());
        expect(
          I3ClientBlocState.seats(response),
          I3ClientBlocState.seats(response),
        );
      });

      test('props are correct', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());

        expect(
          I3ClientBlocState.seats(response).props,
          equals([response.id, 'seats']),
        );
      });
    });

    group('I3ClientBlocState.sync', () {
      test('supports value comparisons', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());
        expect(
          I3ClientBlocState.sync(response),
          I3ClientBlocState.sync(response),
        );
      });

      test('props are correct', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());

        expect(
          I3ClientBlocState.sync(response).props,
          equals([response.id, 'sync']),
        );
      });
    });

    group('I3ClientBlocState.tick', () {
      test('supports value comparisons', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());
        expect(
          I3ClientBlocState.tick(response),
          I3ClientBlocState.tick(response),
        );
      });

      test('props are correct', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());

        expect(
          I3ClientBlocState.tick(response).props,
          equals([response.id, 'tick']),
        );
      });
    });

    group('I3ClientBlocState.tree', () {
      test('supports value comparisons', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());
        expect(
          I3ClientBlocState.tree(response),
          I3ClientBlocState.tree(response),
        );
      });

      test('props are correct', () {
        final response =
            IPCResponse(id: const Uuid().v4(), pid: const Uuid().v4());

        expect(
          I3ClientBlocState.tree(response).props,
          equals([response.id, 'tree']),
        );
      });
    });
  });
}
