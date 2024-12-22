import 'package:meta/meta.dart';

@immutable
class IpcCommandRepositoryError {
  const IpcCommandRepositoryError({
    required this.error,
    required this.stackTrace,
  });
  final Object error;
  final StackTrace stackTrace;
}
