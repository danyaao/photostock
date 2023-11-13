import 'dart:async';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:photostock/features/common/domain/entity/failure/failure.dart';

/// Обработчик ошибок из [Exception] в [Failure]
class PhotoErrorHandler {
  const PhotoErrorHandler._();

  /// Обработать запрос
  static Future<T> handle<T>(
    FutureOr<T> Function() action, {
    void Function()? onError,
    List<ErrorHandleStrategy> additionalStrategies = const [],
  }) async {
    try {
      final result = await action();

      return result;
    } on Exception catch (e, stackTrace) {
      onError?.call();

      final strategies = {
        ...additionalStrategies,
        ..._defaultErrorStrategies,
      };
      final match = strategies.firstWhereOrNull(
        (strategy) => strategy._typeForHandle == e.runtimeType,
      );

      final failure = match?.call(e, stackTrace) ?? const Failure();

      Error.throwWithStackTrace(failure, stackTrace);
    }
  }
}

/// Дефолтный набор стратегий
const List<ErrorHandleStrategy> _defaultErrorStrategies = [
  DioErrorStrategy(),
  UnknownStrategy(),
];

/// Базовый класс стратегии обработки ошибки
@immutable
abstract class ErrorHandleStrategy<E extends Exception> {
  @override
  int get hashCode => E.hashCode;

  Type get _typeForHandle => E;

  /// @nodoc
  const ErrorHandleStrategy();

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      other is ErrorHandleStrategy && _typeForHandle == other._typeForHandle;

  /// Реализовать стратегию
  Failure call(E e, StackTrace stackTrace);
}

/// Обработка ошибок типа [DioException]
class DioErrorStrategy extends ErrorHandleStrategy<DioException> {
  /// @nodoc
  const DioErrorStrategy();

  @override
  Failure call(DioException e, StackTrace stackTrace) {
    return e.error! as Failure;
  }
}

/// Стратегия обработки [Exception]
class UnknownStrategy extends ErrorHandleStrategy<Exception> {
  /// @nodoc
  const UnknownStrategy();

  @override
  Failure call(Exception e, StackTrace stackTrace) {
    return const Failure();
  }
}
