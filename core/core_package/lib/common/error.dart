class AppError {
  late String _message;
  final Enum type;
  final StackTrace stackTrace;
  final Object error;
  String get message => _message;

  AppError({
    required this.error,
    String? message,
    required this.type,
    required this.stackTrace,
  }) {
    _message = message ??= error.toString();
  }
}
