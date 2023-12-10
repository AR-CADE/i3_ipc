// ignore_for_file: prefer_const_constructors
import 'package:i3_ipc/domain/i3_client/bloc/i3_client_bloc.dart';
import 'package:test/test.dart';

void main() {
  group('I3ClientBlocState', () {
    group('I3ClientBlocState.unknown', () {
      test('supports value comparisons', () {
        expect(
          I3ClientBlocState.unknown(),
          I3ClientBlocState.unknown(),
        );
      });
    });

    group('I3ClientBlocState.close', () {
      test('supports value comparisons', () {
        expect(
          I3ClientBlocState.close('pid'),
          I3ClientBlocState.close('pid'),
        );
      });
    });
  });
}
