import 'package:elementary/elementary.dart';

/// Interface of [FavoriteListModel].
abstract interface class IFavoriteListModel extends ElementaryModel {}

/// Model for FavoriteList screen.
class FavoriteListModel extends ElementaryModel implements IFavoriteListModel {
  /// Create an instance [FavoriteListModel].
  FavoriteListModel();
}
