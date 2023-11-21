import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/navigation/domain/entity/app_route_names.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/features/photo/presentation/screens/photo_details/photo_details_widget_model.dart';
import 'package:photostock/features/photo/presentation/widgets/arrow_back_button.dart';
import 'package:photostock/features/photo/presentation/widgets/favorite_button.dart';
import 'package:photostock/features/photo/presentation/widgets/half_screen_photo.dart';
import 'package:photostock/features/photo/presentation/widgets/left_align_text.dart';

/// Elementary widget for PhotoDetails screen.
@RoutePage(name: AppRouteNames.photoDetailsScreen)
class PhotoDetailsWidget extends ElementaryWidget<IPhotoDetailsWidgetModel> {
  /// Create an instance of [PhotoDetailsWidget].
  const PhotoDetailsWidget({
    required this.photo,
    Key? key,
    WidgetModelFactory widgetModelFactory = createPhotoDetailsWidgetModel,
  }) : super(widgetModelFactory, key: key);

  /// [Photo] to show.
  final Photo photo;

  @override
  Widget build(IPhotoDetailsWidgetModel wm) {
    // TODO(me): move to theme.
    const textStyle = TextStyle(
      fontSize: 32,
      color: Colors.black,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Stack(
            children: [
              HalfScreenPhoto(photo: photo),
              ArrowBackButton(
                onBackButtonTap: wm.onBackButtonTap,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LeftAlignText(
                          text: photo.username,
                          textStyle: textStyle,
                        ),
                        LeftAlignText(
                          text: '${photo.likesCount} likes',
                          textStyle: textStyle,
                        ),
                      ],
                    ),
                    ValueListenableBuilder(
                      valueListenable: wm.isFavorite,
                      builder: (_, isFavorite, __) => FavoriteButton(
                        isFavorite: isFavorite,
                        onTap: wm.onFavoriteButtonTap,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const LeftAlignText(
                  text: 'Note:',
                  textStyle: textStyle,
                ),
                TextField(
                  controller: wm.noteTextEditingController,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
