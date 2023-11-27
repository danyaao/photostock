import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/features/photo/domain/repository/photo_storage_repository.dart';

/// [IFavoriteUseCase] for handling actions with [IPhotoStorageRepository].
abstract interface class IFavoriteUseCase {
  /// Change favorite status of [Photo].
  Future<void> toggleFavorite({
    required Photo photo,
  });

  /// Check if [Photo] is in favorite.
  Future<bool> isFavorite({
    required String id,
  });

  /// Get [Photo] by id or [Null].
  Future<Photo?> getPhoto({
    required String id,
  });

  /// Yield [List] of [Photo] on favorite changes.
  Stream<List<Photo>> watchFavoriteChange();

  /// Get [List] of favorite [Photo].
  Future<List<Photo>> getFavoritePhotoList();

  /// Add note for [Photo].
  Future<void> addNote({
    required Photo photo,
    required String note,
  });
}

/// [IFavoriteUseCase] implementation.
class FavoriteUseCase implements IFavoriteUseCase {
  /// Create an instance of [FavoriteUseCase].
  const FavoriteUseCase({
    required IPhotoStorageRepository photoStorageRepository,
  }) : _photoStorageRepository = photoStorageRepository;

  final IPhotoStorageRepository _photoStorageRepository;

  @override
  Future<void> addNote({
    required Photo photo,
    required String note,
  }) async {
    final photoWithNote = photo.copyWith(note: note);

    await _photoStorageRepository.upsertPhoto(photo: photoWithNote);
  }

  @override
  Future<Photo?> getPhoto({
    required String id,
  }) =>
      _photoStorageRepository.getPhoto(id: id);

  @override
  Future<bool> isFavorite({
    required String id,
  }) async {
    final photo = await getPhoto(id: id);

    return photo != null;
  }

  @override
  Future<void> toggleFavorite({
    required Photo photo,
  }) async {
    final isFavoriteTemp = await isFavorite(id: photo.id);

    if (isFavoriteTemp) {
      await _photoStorageRepository.deletePhoto(id: photo.id);
    } else {
      await _photoStorageRepository.upsertPhoto(photo: photo);
    }
  }

  @override
  Stream<List<Photo>> watchFavoriteChange() =>
      _photoStorageRepository.watchPhotoList();

  @override
  Future<List<Photo>> getFavoritePhotoList() =>
      _photoStorageRepository.getPhotoList();
}
