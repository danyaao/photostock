import 'package:blurhash/blurhash.dart';
import 'package:photostock/api/photo_api/photo_api.dart';
import 'package:photostock/features/photo/data/data.dart';
import 'package:photostock/features/photo/domain/domain.dart';
import 'package:photostock/util/error_handler/error_handler.dart';

/// Photo repository implementation.
class PhotoRepository implements IPhotoRepository {
  /// Default constructor.
  const PhotoRepository({
    required PhotoApi photoApi,
  }) : _photoApi = photoApi;

  final PhotoApi _photoApi;

  @override
  Future<List<Photo>> getPhotos({
    required int page,
  }) async {
    return PhotoErrorHandler.handle(() async {
      // ignore: do_not_use_environment
      const clientId = String.fromEnvironment('client_id');

      final photosFromNetwork = await _photoApi.getPhotos(
        clientId: clientId,
        page: page,
      );

      final photos = <Photo>[];

      for (final photoRM in photosFromNetwork) {
        final blurHashImage = await BlurHash.decode(photoRM.blurHash, 158, 158);

        final photo = photoRM.toDomain(
          blurHashImage: blurHashImage,
        );
        photos.add(photo);
      }

      return photos;
    });
  }
}
