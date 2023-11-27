import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:photostock/core/di/inherited_container.dart';
import 'package:photostock/core/union_state/union_state_action_handler_mixin.dart';
import 'package:photostock/features/photo/di/photo_scope.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/features/photo/presentation/screens/favorite_list/favorite_list_model.dart';
import 'package:photostock/features/photo/presentation/screens/favorite_list/favorite_list_widget.dart';
import 'package:photostock/features/photo/presentation/screens/photo_details/photo_details_widget.dart';
import 'package:union_state/union_state.dart';

/// Interface of [FavoriteListWidgetModel].
abstract interface class IFavoriteListWidgetModel implements IWidgetModel {
  /// Photos for UnionStateBuilder.
  UnionStateNotifier<PagingController<int, Photo>>
      get unionStatePagingController;

  /// Refresh.
  void onRefresh();

  /// Open photo.
  void onPhotoSelected({
    required int index,
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

  final PagingController<int, Photo> _pagingController =
      PagingController(firstPageKey: 0);

  final UnionStateNotifier<PagingController<int, Photo>>
      _unionStatePagingController =
      UnionStateNotifier<PagingController<int, Photo>>.loading();

  @override
  UnionStateNotifier<PagingController<int, Photo>>
      get unionStatePagingController => _unionStatePagingController;

  // TODO(me): Implement onRefresh for FavoriteList.
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

  Future<void> _onFavoriteChanged({
    required List<Photo> photoList,
  }) async {
    await handleUnionStateAction(
      action: () async {
        _pagingController.value = PagingState(itemList: photoList);

        return _pagingController;
      },
      unionStateNotifier: _unionStatePagingController,
    );
  }

  @override
  Future<void> initWidgetModel() async {
    super.initWidgetModel();
    model.getPhotoList().listen((photoList) {
      _onFavoriteChanged(photoList: photoList);
    });

    final photos = await model.getPhotoList().last;

    await _onFavoriteChanged(photoList: photos);
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}

/// Factory for [FavoriteListWidgetModel].
FavoriteListWidgetModel createFavoriteListWidgetModel(
  BuildContext context,
) {
  final photoScope = InheritedContainer.read<IPhotoScope>(context);

  final model = FavoriteListModel(
    photoStorageRepository: photoScope.photoStorageRepository,
  );

  //final appScope = InheritedContainer.read<IAppScope>(context);

  return FavoriteListWidgetModel(
    model: model,
    //appRouter: appScope.router,
  );
}
