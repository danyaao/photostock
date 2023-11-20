import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:photostock/features/navigation/domain/entity/app_route_names.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/features/photo/presentation/screens/favorite_list/favorite_list_widget_model.dart';
import 'package:photostock/features/photo/presentation/widgets/photo_app_bar.dart';
import 'package:photostock/features/photo/presentation/widgets/photo_card_grid_view.dart';
import 'package:union_state/union_state.dart';

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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                const PhotoAppBar(
                  label: 'Favorites',
                ),
              ];
            },
            body: UnionStateListenableBuilder<PagingController<int, Photo>>(
              unionStateListenable: wm.unionStatePagingController,
              builder: (_, pagingController) {
                return PhotoCardGridView(
                  pagingController: pagingController,
                  onRefresh: wm.onRefresh,
                  onPhotoSelected: (index) {
                    wm.onPhotoSelected(index: index);
                  },
                );
              },
              loadingBuilder: (_, __) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              failureBuilder: (_, failure, __) {
                return Center(
                  child: Column(
                    children: [
                      Text('Whoops!\n$failure'),
                      const SizedBox(
                        height: 100,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          wm.onRefresh();
                        },
                        child: const Text('Try again'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
