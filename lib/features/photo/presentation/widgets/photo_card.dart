import 'package:flutter/material.dart';
import 'package:photostock/assets/text/text_extension.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/features/photo/domain/entity/photo_ui.dart';

/// Photo card widget.
class PhotoCard extends StatelessWidget {
  /// Default constructor.
  const PhotoCard({
    required this.photo,
    required this.onTap,
    required this.onFavoriteTap,
    required this.isFavorite,
    required this.index,
    super.key,
  });

  /// Photo model to show.
  final PhotoUI photo;

  /// On tap photo action.
  final ValueSetter<int> onTap;

  /// On favorite button tap.
  final ValueSetter<int> onFavoriteTap;

  /// Is [Photo] in favorite.
  final bool isFavorite;

  /// Photo index.
  final int index;

  @override
  Widget build(BuildContext context) {
    final text = AppTextTheme.of(context);

    return SizedBox(
      width: 182,
      height: 182,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          shadowColor: photo.shadowColor,
          child: InkWell(
            onTap: () => onTap(index),
            borderRadius: BorderRadius.circular(30),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    photo.url,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    loadingBuilder: (_, child, imageChunkEvent) {
                      if (imageChunkEvent == null) return child;
                      return Center(
                        child: Image.memory(
                          photo.blurHash,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      bottom: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          photo.username,
                          style: text.bold.copyWith(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${photo.likesCount} likes',
                          style: text.regular.copyWith(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      right: 8,
                    ),
                    child: InkWell(
                      onTap: () => onFavoriteTap(index),
                      borderRadius: BorderRadius.circular(100),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          right: 8,
                        ),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_outline,
                          color:
                              isFavorite ? Colors.red.shade300 : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
