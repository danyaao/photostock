import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/core/di/inherited_container.dart';
import 'package:photostock/core/union_state/union_state_action_handler_mixin.dart';
import 'package:photostock/features/photo/di/photo_scope.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/features/photo/domain/use_case/favorite_use_case.dart';
import 'package:photostock/features/photo/presentation/screens/favorite_list/favorite_list_model.dart';
import 'package:photostock/features/photo/presentation/screens/favorite_list/favorite_list_widget.dart';
import 'package:photostock/features/photo/presentation/screens/photo_details/photo_details_widget.dart';
import 'package:union_state/union_state.dart';

/// Interface of [FavoriteListWidgetModel].
abstract interface class IFavoriteListWidgetModel implements IWidgetModel {
  /// Photos for UnionStateBuilder.
  UnionStateNotifier<List<Photo>> get unionStatePhotoList;

  /// Refresh.
  void onRefresh();

  /// Open photo.
  void onPhotoSelected({
    required int index,
  });

  /// Change [Photo] favorite status.
  Future<void> toggleFavorite({
    required int index,
  });

  /// On reorder.
  void onReorder({
    required int oldIndex,
    required int newIndex,
  });
}

/// Widget model for FavoriteList screen.
class FavoriteListWidgetModel
    extends WidgetModel<FavoriteListWidget, IFavoriteListModel>
    with UnionStateActionHandlerMixin<FavoriteListWidget, IFavoriteListModel>
    implements IFavoriteListWidgetModel {
  /// Create an instance of [FavoriteListWidgetModel].
  FavoriteListWidgetModel({
    required FavoriteListModel model,
    //required AppRouter appRouter,
  }) : super(model);
  //_appRouter = appRouter;

  //final AppRouter _appRouter;

  final UnionStateNotifier<List<Photo>> _unionStatePhotoList =
      UnionStateNotifier<List<Photo>>.loading();

  @override
  UnionStateNotifier<List<Photo>> get unionStatePhotoList =>
      _unionStatePhotoList;


  // TODO(me): Implement onRefresh for FavoriteList.
  @override
  Future<void> onRefresh() async {}

  @override
  void onPhotoSelected({
    required int index,
  }) {
    final photo = _unionStatePhotoList.value.data?[index];

    // TODO(me): Replace Navigator with AppRouter.
    if (photo != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PhotoDetailsWidget(photoFromList: photo),
        ),
      );
    }
  }

  @override
  Future<void> toggleFavorite({
    required int index,
  }) async {
    final photoList = _unionStatePhotoList.value.data;

    if (photoList != null) {
      await model.toggleFavorite(photo: photoList[index]);
    }
  }

  Future<void> _onFavoriteChanged({
    required List<Photo> photoList,
  }) async {
    await handleUnionStateAction(
      action: () async => photoList,
      unionStateNotifier: _unionStatePhotoList,
    );
  }

  @override
  void onReorder({
    required int oldIndex,
    required int newIndex,
  }) {
    final photoList = _unionStatePhotoList.value.data;

    if (photoList != null) {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }

      final item = photoList.removeAt(oldIndex);
      photoList.insert(newIndex, item);

      _unionStatePhotoList.content(photoList);
    }
  }

  @override
  Future<void> initWidgetModel() async {
    super.initWidgetModel();

    model.watchFavoriteChange().listen((photoList) {
      _onFavoriteChanged(photoList: photoList);
    });

    final photos = await model.watchFavoriteChange().last;

    await _onFavoriteChanged(photoList: photos);
  }
}

/// Factory for [FavoriteListWidgetModel].
FavoriteListWidgetModel createFavoriteListWidgetModel(
  BuildContext context,
) {
  final photoScope = InheritedContainer.read<IPhotoScope>(context);

  final model = FavoriteListModel(
    favoriteUseCase: FavoriteUseCase(
        photoStorageRepository: photoScope.photoStorageRepository),
  );

  //final appScope = InheritedContainer.read<IAppScope>(context);

  return FavoriteListWidgetModel(
    model: model,
    //appRouter: appScope.router,
  );
}
