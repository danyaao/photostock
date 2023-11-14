import 'package:elementary/elementary.dart';
import 'package:photostock/features/common/domain/entity/failure/common_failure.dart';
import 'package:photostock/features/common/domain/entity/failure/failure.dart';
import 'package:union_state/union_state.dart';

/// Actions handler.
mixin UnionStateActionHandlerMixin<W extends ElementaryWidget<IWidgetModel>,
    M extends ElementaryModel> on WidgetModel<W, M> {
  /// Handle action method.
  Future<void> handleUnionStateAction<T>({
    required Future<T> Function() action,
    required UnionStateNotifier<T> unionStateNotifier,
  }) async {
    try {
      final result = await action();
      unionStateNotifier.content(result);
    } on Object catch (e) {
      final failure = _mapError(e);
      unionStateNotifier.failure(failure);
    }
  }

  Failure _mapError(Object e) {
    if (e is Failure) return e;

    // TODO(me): доработать маппер ошибок.
    return const CommonFailure.noInternet();
  }
}
