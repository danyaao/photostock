import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/photo/domain_models/photo.dart';
import 'package:photostock/features/photo/screens/photo_list/photo_list.dart';
import 'package:photostock/features/photo/widgets/photo_app_bar.dart';
import 'package:photostock/features/photo/widgets/photo_card.dart';

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
        body: ValueListenableBuilder<List<Photo>>(
          valueListenable: wm.photos,
          builder: (_, photos, __) {
            return RefreshIndicator(
              onRefresh: () async {
                wm.onRefresh();
              },
              child: GridView.builder(
                itemCount: photos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return PhotoCard(
                    photo: photos[index],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
