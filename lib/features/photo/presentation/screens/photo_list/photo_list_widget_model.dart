import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:photostock/core/di/inherited_container.dart';
import 'package:photostock/core/union_state/union_state_action_handler_mixin.dart';
import 'package:photostock/features/photo/di/photo_scope.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/features/photo/domain/use_case/favorite_use_case.dart';
import 'package:photostock/features/photo/presentation/screens/photo_details/photo_details_widget.dart';
import 'package:photostock/features/photo/presentation/screens/photo_list/photo_list_model.dart';
import 'package:photostock/features/photo/presentation/screens/photo_list/photo_list_widget.dart';
import 'package:union_state/union_state.dart';

/// Interface of [PhotoListWidgetModel].
abstract interface class IPhotoListWidgetModel implements IWidgetModel {
  /// Photos for UnionStateBuilder.
  UnionStateNotifier<PagingController<int, Photo>>
      get unionStatePagingController;

  /// Refresh.
  void onRefresh();

  /// Open [Photo].
  void onPhotoSelected({
    required int index,
  });

  /// Change [Photo] favorite status.
  Future<void> toggleFavorite({
    required int index,
  });

  /// Load new page.
  void onPageRequested({
    required int pageKey,
  });
}

/// Widget model for PhotoList screen.
class PhotoListWidgetModel extends WidgetModel<PhotoListWidget, IPhotoListModel>
    with UnionStateActionHandlerMixin<PhotoListWidget, IPhotoListModel>
    implements IPhotoListWidgetModel {
  /// Create an instance of [PhotoListWidgetModel].
  PhotoListWidgetModel({required IPhotoListModel model}) : super(model);
  // : _appRouter = appRouter,
  //   super(model);

  //final AppRouter _appRouter;

  final PagingController<int, Photo> _pagingController =
      PagingController(firstPageKey: 0);

  final UnionStateNotifier<PagingController<int, Photo>>
      _unionStatePagingController =
      UnionStateNotifier<PagingController<int, Photo>>.loading();

  @override
  UnionStateNotifier<PagingController<int, Photo>>
      get unionStatePagingController => _unionStatePagingController;

  @override
  Future<void> onRefresh() async {}

  @override
  void onPhotoSelected({
    required int index,
  }) {
    final photo = _unionStatePagingController.value.data?.itemList?[index];

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
    final photoList = _unionStatePagingController.value.data?.itemList;

    if (photoList != null) {
      await model.toggleFavorite(photo: photoList[index]);
    }
  }

  @override
  Future<void> onPageRequested({
    required int pageKey,
  }) async {
    await handleUnionStateAction(
      action: () async {
        final newPhotos = await model.loadNewPage(pageKey: pageKey);
        final isLastPage = newPhotos.length < 10;
        if (isLastPage) {
          _pagingController.appendLastPage(newPhotos);
        } else {
          final nextPage = pageKey + newPhotos.length;
          _pagingController.appendPage(newPhotos, nextPage);
        }

        return _pagingController;
      },
      unionStateNotifier: _unionStatePagingController,
    );
  }

  Future<void> _updateOnFavoriteChange({
    required List<Photo> newPhotoList,
  }) async {
    await handleUnionStateAction(
        action: () async {
          final currentPhotoList = _pagingController.itemList ?? [];

          final newPhotoListIds = newPhotoList.map((photo) => photo.id).toSet();
          final currentPhotoListIds =
              currentPhotoList.map((photo) => photo.id).toList();

          for (var i = 0; i < currentPhotoList.length; i++) {
            if (newPhotoListIds.contains(currentPhotoListIds[i])) {
              currentPhotoList[i] = newPhotoList.firstWhere(
                (photo) => photo.id == currentPhotoList[i].id,
              );
            } else {
              currentPhotoList[i] = currentPhotoList[i].copyWith(
                isFavorite: false,
              );
            }
          }

          // TODO(me): remove notifyListenres.
          // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
          _pagingController.notifyListeners();

          return _pagingController;
        },
        unionStateNotifier: _unionStatePagingController);
  }

  @override
  Future<void> initWidgetModel() async {
    super.initWidgetModel();
    model.watchFavoriteChange().listen(
      (newPhotoList) {
        _updateOnFavoriteChange(newPhotoList: newPhotoList);
      },
    );
    _pagingController.addPageRequestListener(
      (pageKey) {
        onPageRequested(pageKey: pageKey);
      },
    );

    await onPageRequested(pageKey: 0);

    final newPhotoList = await model.getFavoritePhotoList();

    await _updateOnFavoriteChange(newPhotoList: newPhotoList);
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}

/// Factory for [PhotoListWidgetModel].
PhotoListWidgetModel createPhotoListWidgetModel(
  BuildContext context,
) {
  final photoScope = InheritedContainer.read<IPhotoScope>(context);

  final favoriteUseCase = FavoriteUseCase(
      photoStorageRepository: photoScope.photoStorageRepository);

  final model = PhotoListModel(
    photoApiRepository: photoScope.photoApiRepository,
    favoriteUseCase: favoriteUseCase,
  );

  //final appScope = InheritedContainer.read<IAppScope>(context);

  return PhotoListWidgetModel(
    model: model,
    //appRouter: appScope.router,
  );
}
