import 'package:elementary/elementary.dart';
import 'package:photostock/features/photo/di/photo_list_scope.dart';
import 'package:photostock/features/photo/domain/domain.dart';

/// Default Elementary model for PhotoList module.
class PhotoListModel extends ElementaryModel {
  /// Default constructor.
  PhotoListModel({
    required IPhotoListScope photoListScope,
  }) : _photoListScope = photoListScope;

  final IPhotoListScope _photoListScope;

  /// Load new page method.
  Future<List<Photo>> loadNewPage({
    required int page,
  }) async {
    final newPhotos =
        await _photoListScope.photoRepository.getPhotos(page: page);

    return newPhotos;
  }
}
