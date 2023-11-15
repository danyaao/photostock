import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/favorite/presentation/screens/favorite_list/favorite_list.dart';
import 'package:photostock/features/navigation/navigation.dart';

/// Elementary widget for FavoriteList screen.
@RoutePage(name: AppRouteNames.favoriteListScreen)
class FavoriteListWidget extends ElementaryWidget<IFavoriteListWidgetModel> {
  /// Create an instance of [FavoriteListWidget].
  const FavoriteListWidget({
    Key? key,
    WidgetModelFactory widgetModelFactory = createFavoriteListWidgetModel,
  }) : super(widgetModelFactory, key: key);

  @override
  Widget build(IFavoriteListWidgetModel wm) {
    return const Scaffold(
      body: Center(
        child: Text('Favorite'),
      ),
    );
  }
}
