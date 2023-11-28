import 'package:elementary/elementary.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/features/photo/domain/use_case/favorite_use_case.dart';

/// Interface of [PhotoDetailsModel].
abstract interface class IPhotoDetailsModel extends ElementaryModel {
  /// Get [Photo] by id or [Null].
  Future<Photo?> getPhoto({
    required String id,
  });

  /// Is [Photo] favorite getter.
  Future<bool> isFavorite({
    required String id,
  });

  /// Delete or store [Photo].
  Future<void> toggleFavorite({
    required Photo photo,
  });

  /// Add note for [Photo].
  Future<void> addNote({
    required Photo photo,
    required String note,
  });
}

/// Model for PhotoDetails screen.
class PhotoDetailsModel extends ElementaryModel implements IPhotoDetailsModel {
  /// Create an instance [PhotoDetailsModel].
  PhotoDetailsModel({
    required IFavoriteUseCase favoriteUseCase,
  }) : _favoriteUseCase = favoriteUseCase;

  final IFavoriteUseCase _favoriteUseCase;

  @override
  Future<Photo?> getPhoto({
    required String id,
  }) =>
      _favoriteUseCase.getPhoto(id: id);

  @override
  Future<bool> isFavorite({required String id}) =>
      _favoriteUseCase.isFavorite(id: id);

  @override
  Future<void> toggleFavorite({required Photo photo}) =>
      _favoriteUseCase.toggleFavorite(photo: photo);

  @override
  Future<void> addNote({
    required Photo photo,
    required String note,
  }) =>
      _favoriteUseCase.addNote(photo: photo, note: note);
}
