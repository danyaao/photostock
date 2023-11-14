/// List of all route names used in temp feature.
///
/// Have to been filled with the entries like this:
/// ```dart
/// /// Name description.
/// static const String screenName = 'screenNameRoute';
/// ```
abstract class AppRouteNames {
  /// Home tabs route name.
  static const String homeTabsScreen = 'homeTabsRouter';

  /// Photo root route name.
  static const String photoRootScreen = 'photoRootRouter';

  /// Photo list route name.
  static const String photoListScreen = 'photoListRouter';

  /// Photo details route name.
  static const String photoDetailsScreen = 'photoDetailsRouter';

  /// Favorite list route name.
  static const String favoriteListScreen = 'favoriteListRouter';
}
