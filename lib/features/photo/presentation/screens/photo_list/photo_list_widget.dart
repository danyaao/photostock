import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:photostock/features/navigation/navigation.dart';
import 'package:photostock/features/photo/domain/domain.dart';
import 'package:photostock/features/photo/presentation/screens/photo_list/photo_list.dart';
import 'package:photostock/features/photo/presentation/widgets/widgets.dart';
import 'package:union_state/union_state.dart';

/// Main widget for PhotoList module
@RoutePage(name: AppRouteNames.photoListScreen)
class PhotoListWidget extends ElementaryWidget<IPhotoListWidgetModel> {
  /// Default constructor
  const PhotoListWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultPhotoListWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPhotoListWidgetModel wm) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                const PhotoAppBar(),
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
              // Можно по идее попробовать сделать что-то такое
              // https://docs.flutter.dev/cookbook/effects/shimmer-loading
              // Но пока пусть будет просто индикатор загрузки)
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
