import 'package:elementary/elementary.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/features/photo/domain/use_case/favorite_use_case.dart';

/// Interface of [FavoriteListModel].
abstract interface class IFavoriteListModel extends ElementaryModel {
  /// Change [Photo] favorite status.
  Future<void> toggleFavorite({
    required Photo photo,
  });

  /// Get photo list as [Stream].
  Stream<List<Photo>> watchFavoriteChange();
}

/// Model for FavoriteList screen.
class FavoriteListModel extends ElementaryModel implements IFavoriteListModel {
  /// Create an instance [FavoriteListModel].
  FavoriteListModel({
    required IFavoriteUseCase favoriteUseCase,
  }) : _favoriteUseCase = favoriteUseCase;

  final IFavoriteUseCase _favoriteUseCase;

  @override
  Future<void> toggleFavorite({
    required Photo photo,
  }) =>
      _favoriteUseCase.toggleFavorite(photo: photo);

  @override
  Stream<List<Photo>> watchFavoriteChange() =>
      _favoriteUseCase.watchFavoriteChange();
}
