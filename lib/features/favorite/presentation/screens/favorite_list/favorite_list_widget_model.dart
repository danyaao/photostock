import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/favorite/presentation/screens/favorite_list/favorite_list.dart';

/// Interface of [FavoriteListWidgetModel].
abstract interface class IFavoriteListWidgetModel implements IWidgetModel {}

/// Widget model for FavoriteList screen.
class FavoriteListWidgetModel
    extends WidgetModel<FavoriteListWidget, IFavoriteListModel>
    implements IFavoriteListWidgetModel {
  /// Create an instance of [FavoriteListWidgetModel].
  FavoriteListWidgetModel(super._model);
}

/// Factory for [FavoriteListWidgetModel].
FavoriteListWidgetModel createFavoriteListWidgetModel(
  BuildContext context,
) {
  final model = FavoriteListModel();

  return FavoriteListWidgetModel(model);
}
