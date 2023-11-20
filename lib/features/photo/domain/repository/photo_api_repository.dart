// ignore_for_file: one_member_abstracts

import 'package:photostock/features/photo/domain/entity/photo.dart';

/// Repository for handling data from api.
abstract interface class IPhotoApiRepository {
  /// Get [Photo] list from api.
  Future<List<Photo>> getPhotoList({
    required int pageKey,
  });
}
