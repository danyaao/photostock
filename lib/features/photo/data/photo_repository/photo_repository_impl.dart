import 'package:blurhash/blurhash.dart';
import 'package:photostock/api/photo_api/photo_api.dart';
import 'package:photostock/features/photo/data/data.dart';
import 'package:photostock/features/photo/domain/domain.dart';

/// Photo repository implementation.
class PhotoRepository implements IPhotoRepository {
  /// Default constructor.
  const PhotoRepository({
    required PhotoApi photoApi,
  }) : _photoApi = photoApi;

  final PhotoApi _photoApi;

  @override
  Future<List<Photo>> getPhotos() async {
    try {
      // TODO(me): fix String.fromEnvironment
      const clientId = String.fromEnvironment(
        'client_id',
      );

      final photosFromNetwork = await _photoApi.getPhotos(
        clientId: clientId,
      );

      final photos = <Photo>[];

      for (final photoRM in photosFromNetwork) {
        final blurHashImage = await BlurHash.decode(photoRM.blurHash, 158, 158);

        final photo = await photoRM.toDomain(
          blurHashImage: blurHashImage,
        );
        photos.add(photo);
      }

      return photos;
    } catch (e) {
      // TODO(me): implement errors handling
      rethrow;
    }
  }
}
