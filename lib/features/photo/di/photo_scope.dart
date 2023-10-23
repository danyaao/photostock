import 'package:dio/dio.dart';
import 'package:photostock/api/photo_api/photo_api.dart';
import 'package:photostock/features/photo/data/photo_repository/photo_repository_impl.dart';
import 'package:photostock/features/photo/domain/domain.dart';

/// Photo  dependencies.
abstract interface class IPhotoScope {
  /// Repository for loading photos.
  IPhotoRepository get photoRepository;
}

/// Photo  dependencies.
class PhotoScope implements IPhotoScope {
  /// Create an instance of [PhotoScope].
  PhotoScope({required Dio dio}) {
    final photoApi = PhotoApi(dio);
    _photoRepository = PhotoRepository(photoApi: photoApi);
  }

  late final IPhotoRepository _photoRepository;

  @override
  IPhotoRepository get photoRepository => _photoRepository;
}
