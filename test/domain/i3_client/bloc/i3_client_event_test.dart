import 'package:i3_ipc/domain/i3_client/bloc/i3_client_bloc.dart';
import 'package:test/test.dart';

void main() {
  group('I3ClientBlocEvent', () {
    group('I3IpcGetBarConfigRequested', () {
      test('supports value equality', () {
        expect(
          const I3IpcGetBarConfigRequested(),
          equals(const I3IpcGetBarConfigRequested()),
        );
      });

      test('props are correct', () {
        expect(
          const I3IpcGetBarConfigRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcGetBindingModesRequested', () {
      test('supports value equality', () {
        expect(
          const I3IpcGetBindingModesRequested(),
          equals(const I3IpcGetBindingModesRequested()),
        );
      });

      test('props are correct', () {
        expect(
          const I3IpcGetBindingModesRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcGetBindingStateRequested', () {
      test('supports value equality', () {
        expect(
          const I3IpcGetBindingStateRequested(),
          equals(const I3IpcGetBindingStateRequested()),
        );
      });

      test('props are correct', () {
        expect(
          const I3IpcGetBindingStateRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcGetConfigRequested', () {
      test('supports value equality', () {
        expect(
          const I3IpcGetConfigRequested(),
          equals(const I3IpcGetConfigRequested()),
        );
      });

      test('props are correct', () {
        expect(
          const I3IpcGetConfigRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcGetInputsRequested', () {
      test('supports value equality', () {
        expect(
          const I3IpcGetInputsRequested(),
          equals(const I3IpcGetInputsRequested()),
        );
      });

      test('props are correct', () {
        expect(
          const I3IpcGetInputsRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcGetMarksRequested', () {
      test('supports value equality', () {
        expect(
          const I3IpcGetMarksRequested(),
          equals(const I3IpcGetMarksRequested()),
        );
      });

      test('props are correct', () {
        expect(
          const I3IpcGetMarksRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcGetOutputsRequested', () {
      test('supports value equality', () {
        expect(
          const I3IpcGetOutputsRequested(),
          equals(const I3IpcGetOutputsRequested()),
        );
      });

      test('props are correct', () {
        expect(
          const I3IpcGetOutputsRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcGetSeatsRequested', () {
      test('supports value equality', () {
        expect(
          const I3IpcGetSeatsRequested(),
          equals(const I3IpcGetSeatsRequested()),
        );
      });

      test('props are correct', () {
        expect(
          const I3IpcGetSeatsRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcGetTreeRequested', () {
      test('supports value equality', () {
        expect(
          const I3IpcGetTreeRequested(),
          equals(const I3IpcGetTreeRequested()),
        );
      });

      test('props are correct', () {
        expect(
          const I3IpcGetTreeRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcGetVersionRequested', () {
      test('supports value equality', () {
        expect(
          const I3IpcGetVersionRequested(),
          equals(const I3IpcGetVersionRequested()),
        );
      });

      test('props are correct', () {
        expect(
          const I3IpcGetVersionRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcGetWorkspacesRequested', () {
      test('supports value equality', () {
        expect(
          const I3IpcGetWorkspacesRequested(),
          equals(const I3IpcGetWorkspacesRequested()),
        );
      });

      test('props are correct', () {
        expect(
          const I3IpcGetWorkspacesRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcSubscribeEventsRequested', () {
      test('supports value equality', () {
        expect(
          const I3IpcSubscribeEventsRequested(),
          equals(const I3IpcSubscribeEventsRequested()),
        );
      });

      test('props are correct', () {
        expect(
          const I3IpcSubscribeEventsRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcExecuteRequested', () {
      test('supports value equality', () {
        expect(
          const I3IpcExecuteRequested(type: 0),
          equals(const I3IpcExecuteRequested(type: 0)),
        );
      });

      test('props are correct', () {
        expect(
          const I3IpcExecuteRequested(type: 0).props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcCommandRequested', () {
      test('supports value equality', () {
        expect(
          const I3IpcCommandRequested(),
          equals(const I3IpcCommandRequested()),
        );
      });

      test('props are correct', () {
        expect(
          const I3IpcCommandRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcSendTickRequested', () {
      test('supports value equality', () {
        expect(
          const I3IpcSendTickRequested(),
          equals(const I3IpcSendTickRequested()),
        );
      });

      test('props are correct', () {
        expect(
          const I3IpcSendTickRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcSyncRequested', () {
      test('supports value equality', () {
        expect(
          const I3IpcSyncRequested(),
          equals(const I3IpcSyncRequested()),
        );
      });

      test('props are correct', () {
        expect(
          const I3IpcSyncRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcCloseRequested', () {
      test('supports value equality', () {
        expect(
          const I3IpcCloseRequested(''),
          equals(const I3IpcCloseRequested('')),
        );
      });

      test('props are correct', () {
        expect(
          const I3IpcCloseRequested('').props,
          equals(['']),
        );
      });
    });
  });
}
