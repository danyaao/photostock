/// Ошибка, обработанная в слое бизнес-логики приложения.
///
/// Ожидается, что это единственный вид ошибки, который мы можем получить
/// в презентационном слое приложения.
class Failure implements Exception {
  /// Сообщение ошибки.
  ///
  /// Должно иметь такое содержание, которое будет понятно при чтении логов.
  final String? message;

  /// Расширенное сообщение об ошибке.
  ///
  /// Не для глаз пользователя. Использовать при логировании или отладке.
  final String? debugMessage;

  /// Default constructor.
  const Failure({
    this.message,
    this.debugMessage,
  });

  @override
  String toString() =>
      'Failure(message: "$message", debugMessage: "$debugMessage")';
}
