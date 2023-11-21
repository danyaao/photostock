import 'package:photostock/features/photo/domain/entity/photo.dart';

/// Repository for handling data from storage.
abstract interface class IPhotoStorageRepository {
  /// Get [Photo] list from storage as [Stream].
  Stream<List<Photo>> getPhotoList();

  /// Get [Photo] or [Null] by id.
  Future<Photo?> maybeGetPhotoById({required String id});

  /// Store [Photo] to storage.
  Future<void> upsertPhoto({
    required Photo photo,
  });

  /// Delete [Photo] to storage.
  Future<void> deletePhoto({
    required String id,
  });

  /// Check if [Photo] is stored.
  Future<bool> isFavorite({
    required String id,
  });
}
