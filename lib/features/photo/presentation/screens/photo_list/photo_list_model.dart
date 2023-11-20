import 'package:elementary/elementary.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/features/photo/domain/repository/photo_api_repository.dart';

/// Interface of [PhotoListModel].
abstract interface class IPhotoListModel extends ElementaryModel {
  /// Load new photo list.
  Future<List<Photo>> loadNewPage({
    required int pageKey,
  });
}

/// Model for PhotoList screen.
class PhotoListModel extends ElementaryModel implements IPhotoListModel {
  /// Create an instance [PhotoListModel].
  PhotoListModel({
    required IPhotoApiRepository photoApiRepository,
  }) : _photoApiRepository = photoApiRepository;

  final IPhotoApiRepository _photoApiRepository;

  @override
  Future<List<Photo>> loadNewPage({
    required int pageKey,
  }) async {
    final newPhotos = await _photoApiRepository.getPhotoList(pageKey: pageKey);

    return newPhotos;
  }
}
