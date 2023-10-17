import 'package:photostock/features/common/domain_models/domain_models.dart';

/// Photo repository.
/// Only remote images for now.
abstract interface class IPhotoRepository {
  /// Method for getting photos.
  Future<List<Photo>> getPhotos();

  /// Method for getting photos from network.
  Future<List<Photo>> getPhotosFromNetwork();
}
