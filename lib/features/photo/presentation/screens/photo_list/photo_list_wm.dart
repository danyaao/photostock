import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/photo/domain/domain.dart';
import 'package:photostock/features/photo/presentation/screens/photo_list/photo_list.dart';
import 'package:provider/provider.dart';
import 'package:union_state/union_state.dart';

/// Widget model for photo list screen
abstract interface class IPhotoListWidgetModel implements IWidgetModel {
  /// Current theme data getter.
  ThemeData get theme;

  /// Photos
  UnionStateNotifier<List<Photo>> get photos;

  /// Refresh method.
  void onRefresh();

  /// Tap photo method.
  void onPhotoSelected(int index);
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

  @override
  ThemeData get theme => Theme.of(context);

  @override
  UnionStateNotifier<List<Photo>> get photos => model.photos;

  @override
  Future<void> onRefresh() async {
    await model.getPhotos();
  }

  @override
  void onPhotoSelected(int index) {}

  @override
  Future<void> initWidgetModel() async {
    super.initWidgetModel();
    await model.getPhotos();
  }
}
