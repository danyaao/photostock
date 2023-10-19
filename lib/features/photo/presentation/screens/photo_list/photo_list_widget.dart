import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/photo/domain/domain.dart';
import 'package:photostock/features/photo/presentation/screens/photo_list/photo_list.dart';
import 'package:photostock/features/photo/presentation/widgets/widgets.dart';
import 'package:union_state/union_state.dart';

/// Main widget for PhotoList module
class PhotoListWidget extends ElementaryWidget<IPhotoListWidgetModel> {
  /// Default constructor
  const PhotoListWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultPhotoListWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPhotoListWidgetModel wm) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            const PhotoAppBar(),
          ];
        },
        body: UnionStateListenableBuilder<List<Photo>>(
          unionStateListenable: wm.photos,
          builder: (_, photos) {
            return PhotoCardGridView(
              photos: photos,
              onRefresh: wm.onRefresh,
              onPhotoSelected: wm.onPhotoSelected,
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
          failureBuilder: (_, exception, __) {
            return Center(
              child: Column(
                children: [
                  Text('Whoops!\n$exception'),
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
    );
  }
}