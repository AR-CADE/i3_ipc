class IpcCommandRepositoryError {
  const IpcCommandRepositoryError({
    required this.error,
    required this.stackTrace,
  });
  final Object error;
  final StackTrace stackTrace;
}
