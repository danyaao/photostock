import 'package:photostock/api/unsplash_api/unsplash_api.dart';
import 'package:photostock/features/common/domain_models/photo.dart';
import 'package:photostock/features/common/repositories/photo_repository/mappers/remote_to_domain.dart';
import 'package:photostock/features/common/repositories/photo_repository/photo_repository.dart';

/// Photo repository implementation.
class PhotoRepository implements IPhotoRepository {
  /// Default constructor.
  const PhotoRepository({
    required UnsplashService unsplashService,
  }) : _unsplashService = unsplashService;

  final UnsplashService _unsplashService;

  // Заглушка пока что
  @override
  Future<List<Photo>> getPhotos() async {
    final photos = <Photo>[];

    return photos;
  }

  @override
  Future<List<Photo>> getPhotosFromNetwork() async {
    try {
      // Анализатор сходит с ума и считает это за ошибку почему-то
      const clientId = String.fromEnvironment(
        'client_id',
      );

      final photosFromNetwork = await _unsplashService.getPhotos(
        clientId: clientId,
      );

      final photos = <Photo>[];

      for (final photoRM in photosFromNetwork) {
        final photo = await photoRM.toDomain();
        photos.add(photo);
      }

      return photos;
    } catch (e) {
      rethrow;
    }
  }
}
