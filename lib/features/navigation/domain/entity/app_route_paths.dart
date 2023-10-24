/// List of all the paths that are used to navigate in temp feature.
///
/// Have to been filled with the entries like this:
/// ```dart
/// /// Path description.
/// static const String screenPath = 'screenPath';
/// ```
abstract class AppRoutePaths {
  /// Path to photo root screen.
  static const String photoRootPath = '/photos';

  /// Path to photo list screen.
  static const String photoListPath = '/list';

  /// Path to photo details screen.
  static const String photoDetailsPath = '/details';
}
