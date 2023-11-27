import 'package:drift/drift.dart';
import 'package:photostock/features/photo/data/mapper/photo_mapper.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/features/photo/domain/repository/photo_storage_repository.dart';
import 'package:photostock/persistence/storage/photo_storage/photo_storage.dart';

/// [IPhotoStorageRepository] implementation.
class PhotoStorageRepository implements IPhotoStorageRepository {
  /// Create an instance of [PhotoStorageRepository].
  const PhotoStorageRepository({
    required PhotoStorage photoStorage,
  }) : _photoStorage = photoStorage;

  final PhotoStorage _photoStorage;

  @override
  Stream<List<Photo>> watchPhotoList() async* {
    final storedPhotoListSelect =
        _photoStorage.select(_photoStorage.storedPhotos);

    final storedPhotoListStream = storedPhotoListSelect.watch();

    await for (final storedPhotoList in storedPhotoListStream) {
      final photoList = storedPhotoList
          .map(
            (storedPhoto) => storedPhoto.toDomain(),
          )
          .toList();

      yield photoList;
    }
  }

  @override
  Future<List<Photo>> getPhotoList() async {
    final storedPhotoListSelect =
        _photoStorage.select(_photoStorage.storedPhotos);

    final storedPhotoList = await storedPhotoListSelect.get();

    final photoList = storedPhotoList.map((photo) => photo.toDomain()).toList();

    return photoList;
  }

  @override
  Future<Photo?> getPhoto({
    required String id,
  }) async {
    final photoListSelect = _photoStorage.select(_photoStorage.storedPhotos)
      ..where((storedPhoto) => storedPhoto.id.contains(id));

    final photoList = await photoListSelect.get();

    return photoList.isEmpty ? null : photoList.first.toDomain();
  }

  Future<void> _insertPhoto({
    required Photo photo,
  }) async {
    await _photoStorage.into(_photoStorage.storedPhotos).insert(
          StoredPhotosCompanion.insert(
            id: photo.id,
            url: photo.url,
            username: photo.username,
            likesCount: photo.likesCount,
            shadowColor: photo.shadowColor,
            blurHash: photo.blurHash,
            note: Value(photo.note),
          ),
        );
  }

  @override
  Future<void> upsertPhoto({
    required Photo photo,
  }) async {
    await deletePhoto(id: photo.id);
    await _insertPhoto(photo: photo);
  }

  @override
  Future<void> deletePhoto({
    required String id,
  }) async {
    final deleteStatement = _photoStorage.delete(_photoStorage.storedPhotos)
      ..where((storedPhoto) => storedPhoto.id.equals(id));

    await deleteStatement.go();
  }
}
