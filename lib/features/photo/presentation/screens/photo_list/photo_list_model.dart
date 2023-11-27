import 'package:elementary/elementary.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/features/photo/domain/repository/photo_api_repository.dart';
import 'package:photostock/features/photo/domain/use_case/favorite_use_case.dart';

/// Interface of [PhotoListModel].
abstract interface class IPhotoListModel extends ElementaryModel {
  /// Load new photo list.
  Future<List<Photo>> loadNewPage({
    required int pageKey,
  });

  /// Change [Photo] favorite status.
  Future<void> toggleFavorite({
    required Photo photo,
  });

  /// Watch favorite change.
  Stream<List<Photo>> watchFavoriteChange();

  /// Get [List] of favorite [Photo].
  Future<List<Photo>> getFavoritePhotoList();
}

/// Model for PhotoList screen.
class PhotoListModel extends ElementaryModel implements IPhotoListModel {
  /// Create an instance [PhotoListModel].
  PhotoListModel({
    required IPhotoApiRepository photoApiRepository,
    required IFavoriteUseCase favoriteUseCase,
  })  : _photoApiRepository = photoApiRepository,
        _favoriteUseCase = favoriteUseCase;

  final IPhotoApiRepository _photoApiRepository;
  final IFavoriteUseCase _favoriteUseCase;

  @override
  Future<List<Photo>> loadNewPage({
    required int pageKey,
  }) async {
    final newPhotos = await _photoApiRepository.getPhotoList(pageKey: pageKey);

    return newPhotos;
  }

  @override
  Future<void> toggleFavorite({required Photo photo}) =>
      _favoriteUseCase.toggleFavorite(photo: photo);

  @override
  Stream<List<Photo>> watchFavoriteChange() =>
      _favoriteUseCase.watchFavoriteChange();

  @override
  Future<List<Photo>> getFavoritePhotoList() =>
      _favoriteUseCase.getFavoritePhotoList();
}
