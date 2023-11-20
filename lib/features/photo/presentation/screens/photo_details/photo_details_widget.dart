import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/navigation/domain/entity/app_route_names.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/features/photo/presentation/screens/photo_details/photo_details_widget_model.dart';

/// Elementary widget for PhotoDetails screen.
@RoutePage(name: AppRouteNames.photoDetailsScreen)
class PhotoDetailsWidget extends ElementaryWidget<IPhotoDetailsWidgetModel> {
  /// Create an instance of [PhotoDetailsWidget].
  const PhotoDetailsWidget({
    required this.photo,
    Key? key,
    WidgetModelFactory widgetModelFactory = createPhotoDetailsWidgetModel,
  }) : super(widgetModelFactory, key: key);

  ///
  final Photo photo;

  @override
  Widget build(IPhotoDetailsWidgetModel wm) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () => wm.onFavoriteButtonTap(photo: photo),
        child: const Icon(
          Icons.favorite,
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              _Photo(photo: photo),
              _BackButton(
                textStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
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
                _LeftAlignText(
                  text: photo.username,
                  textStyle: const TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                  ),
                ),
                _LeftAlignText(
                  text: '${photo.likesCount} likes',
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
                const _LeftAlignText(
                  text: 'Note:',
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
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

class _LeftAlignText extends StatelessWidget {
  const _LeftAlignText({
    required this.text,
    required this.textStyle,
  });

  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({
    required this.textStyle,
    required this.onBackButtonTap,
  });

  final TextStyle textStyle;
  final VoidCallback onBackButtonTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          top: 30,
        ),
        child: TextButton(
          onPressed: onBackButtonTap,
          child: Row(
            children: [
              const Icon(
                Icons.arrow_back_ios,
                size: 10,
                color: Colors.white,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                'Back',
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Photo extends StatelessWidget {
  const _Photo({
    required this.photo,
  });

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Image.network(
          photo.url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
