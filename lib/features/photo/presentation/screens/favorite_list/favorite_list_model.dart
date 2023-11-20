import 'package:elementary/elementary.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/features/photo/domain/repository/photo_storage_repository.dart';

/// Interface of [FavoriteListModel].
abstract interface class IFavoriteListModel extends ElementaryModel {
  /// Get photo list as [Stream].
  Stream<List<Photo>> getPhotoList();
}

/// Model for FavoriteList screen.
class FavoriteListModel extends ElementaryModel implements IFavoriteListModel {
  /// Create an instance [FavoriteListModel].
  FavoriteListModel({
    required IPhotoStorageRepository photoStorageRepository,
  }) : _photoStorageRepository = photoStorageRepository;

  final IPhotoStorageRepository _photoStorageRepository;

  @override
  Stream<List<Photo>> getPhotoList() async* {
    final photoListStream = _photoStorageRepository.getPhotoList();

    await for (final photoList in photoListStream) {
      yield photoList;
    }
  }
}
