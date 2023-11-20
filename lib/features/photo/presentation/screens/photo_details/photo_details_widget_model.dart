import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/core/di/inherited_container.dart';
import 'package:photostock/features/app/di/app_scope.dart';
import 'package:photostock/features/navigation/service/router.dart';
import 'package:photostock/features/photo/data/repository/photo_storage_repository_impl.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/features/photo/presentation/screens/photo_details/photo_details_model.dart';
import 'package:photostock/features/photo/presentation/screens/photo_details/photo_details_widget.dart';

/// Interface of [PhotoDetailsWidgetModel].
abstract interface class IPhotoDetailsWidgetModel implements IWidgetModel {
  /// [TextEditingController] for note form.
  TextEditingController get noteTextEditingController;

  /// Route back.
  void onBackButtonTap();

  /// Add or delete from favorite.
  void onFavoriteButtonTap({required Photo photo});

  /// Add note.
  void onNoteSave({required Photo photo});
}

/// Widget model for PhotoDetails screen.
class PhotoDetailsWidgetModel
    extends WidgetModel<PhotoDetailsWidget, IPhotoDetailsModel>
    implements IPhotoDetailsWidgetModel {
  /// Create an instance of [PhotoDetailsWidgetModel].
  PhotoDetailsWidgetModel({
    required PhotoDetailsModel model,
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(model);

  final AppRouter _appRouter;

  final TextEditingController _noteTextEditingController =
      TextEditingController();

  @override
  TextEditingController get noteTextEditingController =>
      _noteTextEditingController;

  @override
  void onBackButtonTap() {
    _appRouter.pop();
  }

  @override
  void onFavoriteButtonTap({required Photo photo}) {
    model.toggleFavorite(photo: photo);
  }

  @override
  void onNoteSave({required Photo photo}) {
    model.addNote(
      photo: photo,
      note: _noteTextEditingController.text,
    );
  }
}

/// Factory for [PhotoDetailsWidgetModel].
PhotoDetailsWidgetModel createPhotoDetailsWidgetModel(BuildContext context) {
  final appScope = InheritedContainer.read<IAppScope>(context);
  final photoStorageRepository =
      PhotoStorageRepository(photoStorage: appScope.photoStorage);

  final model =
      PhotoDetailsModel(photoStorageRepository: photoStorageRepository);

  final appRouter = InheritedContainer.read<IAppScope>(context).router;

  return PhotoDetailsWidgetModel(
    model: model,
    appRouter: appRouter,
  );
}
