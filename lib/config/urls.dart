import 'package:photostock/config/environment/environment.dart';

/// Server urls.
abstract class Url {
  /// TRest url.
  static String get testUrl => 'https://api.unsplash.com/';

  /// Prod url.
  static String get prodUrl => 'https://api.unsplash.com/';

  /// Dev url.
  static String get devUrl => 'https://api.unsplash.com/';

  /// Base url.
  static String get baseUrl => Environment.instance().config.url;
}
