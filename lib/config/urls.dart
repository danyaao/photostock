import 'package:photostock/config/environment/environment.dart';

/// Server urls.
abstract class Url {
  /// TRest url.
  static String get testUrl => 'https://api.unsplash.com/';

  /// Prod url.
  static String get prodUrl => 'https://prod.surfstudio.ru/api';

  /// Dev url.
  static String get devUrl => 'https://localhost:9999/food/hs/ExchangeSotr';

  /// Base url.
  static String get baseUrl => Environment.instance().config.url;
}
