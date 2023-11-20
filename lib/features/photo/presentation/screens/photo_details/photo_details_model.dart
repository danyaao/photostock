import 'package:elementary/elementary.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/features/photo/domain/repository/photo_storage_repository.dart';

/// Interface of [PhotoDetailsModel].
abstract interface class IPhotoDetailsModel extends ElementaryModel {
  /// Delete or store [Photo].
  Future<void> toggleFavorite({required Photo photo});

  /// Add note for [Photo].
  Future<void> addNote({
    required Photo photo,
    required String note,
  });
}

/// Model for PhotoDetails screen.
class PhotoDetailsModel extends ElementaryModel implements IPhotoDetailsModel {
  /// Create an instance [PhotoDetailsModel].
  PhotoDetailsModel({
    required IPhotoStorageRepository photoStorageRepository,
  }) : _photoStorageRepository = photoStorageRepository;

  final IPhotoStorageRepository _photoStorageRepository;

  @override
  Future<void> toggleFavorite({required Photo photo}) async {
    final isFavorite = await _photoStorageRepository.isFavorite(id: photo.id);

    if (isFavorite) {
      _photoStorageRepository.deletePhoto(id: photo.id);
    } else {
      await _photoStorageRepository.upsertPhoto(photo: photo);
    }
  }

  @override
  Future<void> addNote({
    required Photo photo,
    required String note,
  }) async {
    final photoWithNote = photo.copyWith(note: note);

    await _photoStorageRepository.upsertPhoto(photo: photoWithNote);
  }
}
