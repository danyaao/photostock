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
import 'package:photostock/features/photo/presentation/widgets/note_form.dart';
import 'package:union_state/union_state.dart';

/// Elementary widget for PhotoDetails screen.
@RoutePage(name: AppRouteNames.photoDetailsScreen)
class PhotoDetailsWidget extends ElementaryWidget<IPhotoDetailsWidgetModel> {
  /// Create an instance of [PhotoDetailsWidget].
  const PhotoDetailsWidget({
    required this.photoFromList,
    Key? key,
    WidgetModelFactory widgetModelFactory = createPhotoDetailsWidgetModel,
  }) : super(widgetModelFactory, key: key);

  /// [Photo] to show.
  final Photo photoFromList;

  @override
  Widget build(IPhotoDetailsWidgetModel wm) {
    // TODO(me): move to theme.
    const textStyle = TextStyle(
      fontSize: 32,
      color: Colors.black,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: UnionStateListenableBuilder(
          unionStateListenable: wm.photo,
          builder: (context, photo) {
            return Column(
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
                          FavoriteButton(
                            isFavorite: photo.isFavorite,
                            onTap: wm.onFavoriteButtonTap,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const LeftAlignText(
                        text: 'Note:',
                        textStyle: textStyle,
                      ),
                      const SizedBox(height: 10),
                      NoteForm(
                        formKey: wm.formKey,
                        controller: wm.noteTextEditingController,
                        onSaveNote: wm.onSaveNote,
                        isEnabled: photo.isFavorite,
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                )
              ],
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
