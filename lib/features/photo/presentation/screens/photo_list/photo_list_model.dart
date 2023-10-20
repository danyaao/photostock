import 'package:elementary/elementary.dart';
import 'package:photostock/features/photo/domain/domain.dart';
import 'package:union_state/union_state.dart';

/// Default Elementary model for PhotoList module.
class PhotoListModel extends ElementaryModel {
  /// Default constructor.
  PhotoListModel({
    required IPhotoRepository photoRepository,
  }) : _photoRepository = photoRepository;

  final IPhotoRepository _photoRepository;

  /// Photos.
  final UnionStateNotifier<List<Photo>> photos =
      UnionStateNotifier<List<Photo>>.loading();

  /// Load photos method.
  Future<void> getPhotos({
    required int page,
  }) async {
    final newPhotos = await _photoRepository.getPhotos(page: page);
    photos.content(newPhotos);
  }

  /// Load new page method.
  Future<void> loadNewPage({
    required int currentPage,
  }) async {
    final oldPhotos = photos.value.data ?? [];
    final newPhotos = await _photoRepository.getPhotos(page: currentPage + 1);
    oldPhotos.addAll(newPhotos);
    final updatedPhotos = oldPhotos.toList();
    photos.content(updatedPhotos);
  }
}
