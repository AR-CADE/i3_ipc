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
  });
}
