import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/navigation/domain/entity/app_route_names.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/features/photo/domain/entity/photo_ui.dart';
import 'package:photostock/features/photo/presentation/screens/favorite_list/favorite_list_widget_model.dart';
import 'package:photostock/features/photo/presentation/widgets/photo_app_bar.dart';
import 'package:photostock/features/photo/presentation/widgets/photo_card.dart';
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
            body: UnionStateListenableBuilder<List<Photo>>(
              unionStateListenable: wm.unionStatePhotoList,
              builder: (context, photoList) {
                return _ReorderablePhotoList(
                  photoList: photoList,
                  onTap: (index) => wm.onPhotoSelected(index: index),
                  onFavoriteTap: (index) => wm.toggleFavorite(index: index),
                  onReorder: (oldIndex, newIndex) => wm.onReorder(
                    oldIndex: oldIndex,
                    newIndex: newIndex,
                  ),
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

class _ReorderablePhotoList extends StatelessWidget {
  const _ReorderablePhotoList({
    required this.photoList,
    required this.onTap,
    required this.onFavoriteTap,
    required this.onReorder,
  });

  final List<Photo> photoList;
  final ValueSetter<int> onTap;
  final ValueSetter<int> onFavoriteTap;
  final Function(int, int) onReorder;

  @override
  Widget build(BuildContext context) {
    final photoUIAdapter = PhotoUIAdapter();
    return ReorderableListView.builder(
      itemCount: photoList.length,
      itemBuilder: (context, index) => PhotoCard(
        key: ValueKey(index.toString()),
        photo: photoUIAdapter(photo: photoList[index]),
        onTap: onTap,
        onFavoriteTap: onFavoriteTap,
        // TODO(me): А зачем?
        isFavorite: photoList[index].isFavorite,
        index: index,
      ),
      onReorder: onReorder,
    );
  }
}
