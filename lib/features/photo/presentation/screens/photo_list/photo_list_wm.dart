import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/photo/domain/domain.dart';
import 'package:photostock/features/photo/presentation/screens/photo_list/photo_list.dart';
import 'package:provider/provider.dart';
import 'package:union_state/union_state.dart';

/// Widget model for photo list screen.
abstract interface class IPhotoListWidgetModel implements IWidgetModel {
  /// Current theme data getter.
  ThemeData get theme;

  /// Photos for UnionStateBuilder.
  UnionStateNotifier<List<Photo>> get photos;

  /// Scroll controller for pagination.
  ScrollController get scrollController;

  /// Refresh method.
  void onRefresh();

  /// Tap photo method.
  void onPhotoSelected(int index);

  /// Load new page method.
  void onNewPageRequested();
}

/// Factory for widget model.
PhotoListWidgetModel defaultPhotoListWidgetModelFactory(BuildContext context) {
  final photoRepository = context.read<IPhotoRepository>();

  final model = PhotoListModel(
    photoRepository: photoRepository,
  );

  return PhotoListWidgetModel(model: model);
}

/// Default widget model for PhotoListWidget.
class PhotoListWidgetModel extends WidgetModel<PhotoListWidget, PhotoListModel>
    implements IPhotoListWidgetModel {
  /// Default constructor
  PhotoListWidgetModel({required PhotoListModel model}) : super(model);

  late final ScrollController _scrollController;

  @override
  ThemeData get theme => Theme.of(context);

  @override
  UnionStateNotifier<List<Photo>> get photos => model.photos;

  @override
  ScrollController get scrollController => _scrollController;

  @override
  Future<void> onRefresh() async {
    await model.getPhotos(page: model.photos.value.data?.length ?? 1);
  }

  @override
  void onPhotoSelected(int index) {}

  @override
  Future<void> onNewPageRequested() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      await model.loadNewPage(
          currentPage: model.photos.value.data?.length ?? 1 % 10);
    }
  }

  @override
  Future<void> initWidgetModel() async {
    super.initWidgetModel();
    await model.getPhotos(page: 1);
    _scrollController = ScrollController();
    _scrollController.addListener(onNewPageRequested);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
