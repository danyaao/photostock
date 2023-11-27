// ignore_for_file: do_not_use_environment

import 'package:blurhash/blurhash.dart';
import 'package:photostock/api/photo_api/service/photo_api.dart';
import 'package:photostock/features/photo/data/mapper/photo_mapper.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/features/photo/domain/repository/photo_api_repository.dart';
import 'package:photostock/util/error_handler/error_handler.dart';

/// [IPhotoApiRepository] implementation.
class PhotoApiRepository implements IPhotoApiRepository {
  /// Create an instance of [PhotoApiRepository].
  const PhotoApiRepository({
    required PhotoApi photoApi,
  }) : _photoApi = photoApi;

  final PhotoApi _photoApi;

  @override
  Future<List<Photo>> getPhotoList({
    required int pageKey,
  }) async {
    return PhotostockErrorHandler.handle(() async {
      const clientId = String.fromEnvironment('client_id');

      final photosFromNetwork = await _photoApi.getPhotos(
        clientId: clientId,
        pageKey: pageKey,
      );

      final photoList = <Photo>[];

      for (final remotePhoto in photosFromNetwork) {
        final blurHash = await BlurHash.decode(remotePhoto.blurHash, 158, 158);

        final photo = remotePhoto.toDomain(
          blurHash: blurHash,
        );

        photoList.add(photo);
      }

      return photoList;
    });
  }
}
