// ignore_for_file: one_member_abstracts

import 'package:photostock/features/photo/domain/domain.dart';

/// Photo repository.
abstract interface class IPhotoRepository {
  /// Method for getting photos from network.
  Future<List<Photo>> getPhotos({
    required int page,
  });
}
