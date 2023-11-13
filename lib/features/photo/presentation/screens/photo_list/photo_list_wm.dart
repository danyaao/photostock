import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:photostock/features/app/di/app_scope.dart';
import 'package:photostock/features/common/mixin/action_handler_mixin.dart';
import 'package:photostock/features/common/widgets/di_scope/di_scope.dart';
import 'package:photostock/features/navigation/navigation.dart';
import 'package:photostock/features/photo/di/photo_scope.dart';
import 'package:photostock/features/photo/domain/domain.dart';
import 'package:photostock/features/photo/presentation/screens/photo_list/photo_list.dart';
import 'package:photostock/util/error_handler/error_handler.dart';
import 'package:union_state/union_state.dart';

/// Widget model for photo list screen.
abstract interface class IPhotoListWidgetModel implements IWidgetModel {
  /// Current theme data getter.
  ThemeData get theme;

  /// Photos for UnionStateBuilder.
  UnionStateNotifier<PagingController<int, Photo>>
      get unionStatePagingController;

  /// Refresh method.
  void onRefresh();

  /// Tap photo method.
  void onPhotoSelected({
    required int index,
  });

  /// Load new page method.
  void onPageRequested({
    required int page,
  });
}

/// Factory for widget model.
PhotoListWidgetModel defaultPhotoListWidgetModelFactory(BuildContext context) {
  final photoScope = InheritedContainer.read<IPhotoScope>(context);

  final appRouter = InheritedContainer.read<IAppScope>(context).router;

  final model = PhotoListModel(
    photoListScope: photoScope,
  );

  return PhotoListWidgetModel(appRouter: appRouter, model: model);
}

/// Default widget model for PhotoListWidget.
class PhotoListWidgetModel extends WidgetModel<PhotoListWidget, PhotoListModel>
    with UnionStateActionHandlerMixin
    implements IPhotoListWidgetModel {
  /// Default constructor
  PhotoListWidgetModel(
      {required AppRouter appRouter, required PhotoListModel model})
      : _appRouter = appRouter,
        super(model);

  final AppRouter _appRouter;

  final PagingController<int, Photo> _pagingController =
      PagingController(firstPageKey: 0);

  final UnionStateNotifier<PagingController<int, Photo>>
      _unionStatePagingController =
      UnionStateNotifier<PagingController<int, Photo>>.loading();

  @override
  ThemeData get theme => Theme.of(context);

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

    if (photo != null) {
      _appRouter.push(PhotoDetailsRouter(photo: photo));
    }
  }

  @override
  Future<void> onPageRequested({
    required int page,
  }) async {
    await handleUnionStateAction(
      action: () async {
        final newPhotos = await model.loadNewPage(page: page);
        final isLastPage = newPhotos.length < 10;
        if (isLastPage) {
          _pagingController.appendLastPage(newPhotos);
        } else {
          final nextPage = page + newPhotos.length;
          _pagingController.appendPage(newPhotos, nextPage);
        }

        return _pagingController;
      },
      unionStateNotifier: _unionStatePagingController,
    );
  }

  @override
  Future<void> initWidgetModel() async {
    super.initWidgetModel();
    _pagingController.addPageRequestListener(
      (page) {
        onPageRequested(page: page);
      },
    );
    await onPageRequested(page: 0);
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
