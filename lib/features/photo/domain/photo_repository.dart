import 'package:photostock/features/photo/domain/domain.dart';

/// Photo repository.
abstract interface class IPhotoRepository {
  /// Method for getting photos from network.
  Future<List<Photo>> getPhotos();
}