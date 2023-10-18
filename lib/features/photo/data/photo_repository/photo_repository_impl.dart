import 'package:photostock/api/photo_service/photo_service.dart';
import 'package:photostock/features/photo/data/photo_repository/mappers/remote_to_domain.dart';
import 'package:photostock/features/photo/data/photo_repository/photo_repository.dart';
import 'package:photostock/features/photo/domain_models/photo.dart';

/// Photo repository implementation.
class PhotoRepository implements IPhotoRepository {
  /// Default constructor.
  const PhotoRepository({
    required UnsplashApi unsplashApi,
  }) : _unsplashApi = unsplashApi;

  final UnsplashApi _unsplashApi;

  @override
  Future<List<Photo>> getPhotosFromNetwork() async {
    try {
      // Анализатор сходит с ума и считает это за ошибку почему-то
      const clientId = String.fromEnvironment(
        'client_id',
      );

      final photosFromNetwork = await _unsplashApi.getPhotos(
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
