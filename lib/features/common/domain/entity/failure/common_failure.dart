import 'package:photostock/features/common/domain/entity/failure/failure.dart';

/// Общая неудача.
class CommonFailure implements Failure {
  @override
  String? get debugMessage => null;

  @override
  String? get message => null;

  /// Default constructor.
  const CommonFailure._();

  /// No internet failure.
  const CommonFailure.noInternet() : this._();
}
