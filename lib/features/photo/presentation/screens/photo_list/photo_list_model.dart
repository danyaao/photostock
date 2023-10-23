import 'package:elementary/elementary.dart';
import 'package:photostock/features/photo/di/photo_scope.dart';
import 'package:photostock/features/photo/domain/domain.dart';

/// Default Elementary model for PhotoList module.
class PhotoListModel extends ElementaryModel {
  /// Default constructor.
  PhotoListModel({
    required IPhotoScope photoListScope,
  }) : _photoScope = photoListScope;

  final IPhotoScope _photoScope;

  /// Load new page method.
  Future<List<Photo>> loadNewPage({
    required int page,
  }) async {
    final newPhotos = await _photoScope.photoRepository.getPhotos(page: page);

    return newPhotos;
  }
}
