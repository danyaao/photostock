// ignore_for_file: one_member_abstracts

import 'package:photostock/api/photo_api/service/photo_api.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';

/// [IPhotoApiRepository] for handling data from api.
abstract interface class IPhotoApiRepository {
  /// Get [Photo] list from [PhotoApi].
  Future<List<Photo>> getPhotoList({
    required int pageKey,
  });
}
