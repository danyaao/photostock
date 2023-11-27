import 'package:photostock/features/photo/domain/repository/photo_api_repository.dart';
import 'package:photostock/features/photo/domain/repository/photo_storage_repository.dart';

/// Dependencies for Photo feature.
abstract interface class IPhotoScope {
  /// Get instance of [IPhotoApiRepository].
  IPhotoApiRepository get photoApiRepository;

  /// Get instance of [IPhotoStorageRepository].
  IPhotoStorageRepository get photoStorageRepository;
}

/// Implementation of [IPhotoScope].
class PhotoScope implements IPhotoScope {
  /// Create an instance of [PhotoScope].
  PhotoScope({
    required IPhotoApiRepository photoApiRepository,
    required IPhotoStorageRepository photoStorageRepository,
  })  : _photoApiRepository = photoApiRepository,
        _photoStorageRepository = photoStorageRepository;

  final IPhotoApiRepository _photoApiRepository;
  final IPhotoStorageRepository _photoStorageRepository;

  @override
  IPhotoApiRepository get photoApiRepository => _photoApiRepository;

  @override
  IPhotoStorageRepository get photoStorageRepository => _photoStorageRepository;
}
