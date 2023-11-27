/// List of all the paths that are used to navigate in temp feature.
///
/// Have to been filled with the entries like this:
/// ```dart
/// /// Path description.
/// static const String screenPath = 'screenPath';
/// ```
abstract class AppRoutePaths {
  /// Path to home tabs screen.
  static const String homeTabsPath = 'home';

  /// Path to photo root screen.
  static const String photoRootPath = '/';

  /// Path to photo list screen.
  static const String photoListPath = 'photo';

  /// Path to photo details screen.
  static const String photoDetailsPath = 'details';

  /// Path to favorite list screen.
  static const String favoriteListPath = 'favorite';
}
