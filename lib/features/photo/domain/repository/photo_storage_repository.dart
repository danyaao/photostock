import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/persistence/storage/photo_storage/photo_storage.dart';

/// [IPhotoStorageRepository] for handling data from [PhotoStorage].
abstract interface class IPhotoStorageRepository {
  /// Watch [List] of [Photo] from [PhotoStorage] as [Stream].
  Stream<List<Photo>> watchPhotoList();

  /// Get [List] of [Photo] from [PhotoStorage] by id or [Null].
  Future<List<Photo>> getPhotoList();

  /// Get [Photo] from [PhotoStorage] by id or [Null].
  Future<Photo?> getPhoto({
    required String id,
  });

  /// Store [Photo] to [PhotoStorage].
  Future<void> upsertPhoto({
    required Photo photo,
  });

  /// Delete [Photo] from [PhotoStorage].
  Future<void> deletePhoto({
    required String id,
  });
}
