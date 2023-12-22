// ignore_for_file: prefer_const_constructors

import 'package:i3_ipc/domain/i3_client/bloc/i3_client_bloc.dart';
import 'package:test/test.dart';

void main() {
  group('I3ClientBlocEvent', () {
    group('I3IpcGetBarConfigRequested', () {
      test('supports value equality', () {
        expect(
          I3IpcGetBarConfigRequested(),
          equals(I3IpcGetBarConfigRequested()),
        );
      });

      test('props are correct', () {
        expect(
          I3IpcGetBarConfigRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcGetBindingModesRequested', () {
      test('supports value equality', () {
        expect(
          I3IpcGetBindingModesRequested(),
          equals(I3IpcGetBindingModesRequested()),
        );
      });

      test('props are correct', () {
        expect(
          I3IpcGetBindingModesRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcGetBindingStateRequested', () {
      test('supports value equality', () {
        expect(
          I3IpcGetBindingStateRequested(),
          equals(I3IpcGetBindingStateRequested()),
        );
      });

      test('props are correct', () {
        expect(
          I3IpcGetBindingStateRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcGetConfigRequested', () {
      test('supports value equality', () {
        expect(
          I3IpcGetConfigRequested(),
          equals(I3IpcGetConfigRequested()),
        );
      });

      test('props are correct', () {
        expect(
          I3IpcGetConfigRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcGetInputsRequested', () {
      test('supports value equality', () {
        expect(
          I3IpcGetInputsRequested(),
          equals(I3IpcGetInputsRequested()),
        );
      });

      test('props are correct', () {
        expect(
          I3IpcGetInputsRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcGetMarksRequested', () {
      test('supports value equality', () {
        expect(
          I3IpcGetMarksRequested(),
          equals(I3IpcGetMarksRequested()),
        );
      });

      test('props are correct', () {
        expect(
          I3IpcGetMarksRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcGetOutputsRequested', () {
      test('supports value equality', () {
        expect(
          I3IpcGetOutputsRequested(),
          equals(I3IpcGetOutputsRequested()),
        );
      });

      test('props are correct', () {
        expect(
          I3IpcGetOutputsRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcGetSeatsRequested', () {
      test('supports value equality', () {
        expect(
          I3IpcGetSeatsRequested(),
          equals(I3IpcGetSeatsRequested()),
        );
      });

      test('props are correct', () {
        expect(
          I3IpcGetSeatsRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcGetTreeRequested', () {
      test('supports value equality', () {
        expect(
          I3IpcGetTreeRequested(),
          equals(I3IpcGetTreeRequested()),
        );
      });

      test('props are correct', () {
        expect(
          I3IpcGetTreeRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcGetVersionRequested', () {
      test('supports value equality', () {
        expect(
          I3IpcGetVersionRequested(),
          equals(I3IpcGetVersionRequested()),
        );
      });

      test('props are correct', () {
        expect(
          I3IpcGetVersionRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcGetWorkspacesRequested', () {
      test('supports value equality', () {
        expect(
          I3IpcGetWorkspacesRequested(),
          equals(I3IpcGetWorkspacesRequested()),
        );
      });

      test('props are correct', () {
        expect(
          I3IpcGetWorkspacesRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcSubscribeEventsRequested', () {
      test('supports value equality', () {
        expect(
          I3IpcSubscribeEventsRequested(),
          equals(I3IpcSubscribeEventsRequested()),
        );
      });

      test('props are correct', () {
        expect(
          I3IpcSubscribeEventsRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcExecuteRequested', () {
      test('supports value equality', () {
        expect(
          I3IpcExecuteRequested(type: 0),
          equals(I3IpcExecuteRequested(type: 0)),
        );
      });

      test('props are correct', () {
        expect(
          I3IpcExecuteRequested(type: 0).props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcCommandRequested', () {
      test('supports value equality', () {
        expect(
          I3IpcCommandRequested(),
          equals(I3IpcCommandRequested()),
        );
      });

      test('props are correct', () {
        expect(
          I3IpcCommandRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcSendTickRequested', () {
      test('supports value equality', () {
        expect(
          I3IpcSendTickRequested(),
          equals(I3IpcSendTickRequested()),
        );
      });

      test('props are correct', () {
        expect(
          I3IpcSendTickRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcSyncRequested', () {
      test('supports value equality', () {
        expect(
          I3IpcSyncRequested(),
          equals(I3IpcSyncRequested()),
        );
      });

      test('props are correct', () {
        expect(
          I3IpcSyncRequested().props,
          equals(['', null]),
        );
      });
    });

    group('I3IpcCloseRequested', () {
      test('supports value equality', () {
        expect(
          I3IpcCloseRequested(''),
          equals(I3IpcCloseRequested('')),
        );
      });

      test('props are correct', () {
        expect(
          I3IpcCloseRequested('').props,
          equals(['']),
        );
      });
    });
  });
}
