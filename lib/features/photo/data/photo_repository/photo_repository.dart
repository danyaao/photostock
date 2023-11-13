// ignore_for_file: one_member_abstracts

import 'package:photostock/features/photo/domain_models/photo.dart';

/// Photo repository.
/// Only remote images for now.
abstract interface class IPhotoRepository {
  /// Method for getting photos from network.
  Future<List<Photo>> getPhotosFromNetwork();
}
