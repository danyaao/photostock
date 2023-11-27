import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/core/di/inherited_container.dart';
import 'package:photostock/features/app/di/app_scope.dart';
import 'package:photostock/features/navigation/service/router.dart';
import 'package:photostock/features/photo/data/repository/photo_storage_repository_impl.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/features/photo/domain/use_case/favorite_use_case.dart';
import 'package:photostock/features/photo/presentation/screens/photo_details/photo_details_model.dart';
import 'package:photostock/features/photo/presentation/screens/photo_details/photo_details_widget.dart';
import 'package:union_state/union_state.dart';

/// Interface of [PhotoDetailsWidgetModel].
abstract interface class IPhotoDetailsWidgetModel implements IWidgetModel {
  /// [UnionStateNotifier] for [Photo].
  UnionStateNotifier<Photo> get photo;

  /// [TextEditingController] for note form.
  TextEditingController get noteTextEditingController;

  /// [GlobalKey] for validation.
  GlobalKey<FormState> get formKey;

  /// Route back.
  void onBackButtonTap();

  /// Add or delete from favorite.
  void onFavoriteButtonTap();

  /// Add note.
  void onSaveNote();
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

  final UnionStateNotifier<Photo> _photo = UnionStateNotifier.loading();

  @override
  UnionStateNotifier<Photo> get photo => _photo;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  GlobalKey<FormState> get formKey => _formKey;

  final TextEditingController _noteTextEditingController =
      TextEditingController();

  @override
  TextEditingController get noteTextEditingController =>
      _noteTextEditingController;

  @override
  Future<void> initWidgetModel() async {
    super.initWidgetModel();
    _photo.content(await model.getPhoto(id: widget.photoFromList.id) ??
        widget.photoFromList);
    _noteTextEditingController.text = _photo.value.data?.note ?? '';
  }

  @override
  void onBackButtonTap() {
    _appRouter.pop();
  }

  @override
  void onFavoriteButtonTap() {
    model.toggleFavorite(photo: widget.photoFromList);
    final currentPhoto = _photo.value.data;
    if (currentPhoto != null) {
      _photo.content(
        currentPhoto.copyWith(
          isFavorite: !currentPhoto.isFavorite,
        ),
      );
    }
  }

  @override
  void onSaveNote() {
    model.addNote(
      photo: _photo.value.data ?? widget.photoFromList,
      note: _noteTextEditingController.text,
    );
  }
}

/// Factory for [PhotoDetailsWidgetModel].
PhotoDetailsWidgetModel createPhotoDetailsWidgetModel(
  BuildContext context,
) {
  final appScope = InheritedContainer.read<IAppScope>(context);
  final photoStorageRepository =
      PhotoStorageRepository(photoStorage: appScope.photoStorage);

  final model = PhotoDetailsModel(
    favoriteUseCase:
        FavoriteUseCase(photoStorageRepository: photoStorageRepository),
  );

  final appRouter = InheritedContainer.read<IAppScope>(context).router;

  return PhotoDetailsWidgetModel(
    model: model,
    appRouter: appRouter,
  );
}
