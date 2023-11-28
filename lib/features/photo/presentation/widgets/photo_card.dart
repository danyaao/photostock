import 'package:flutter/material.dart';
import 'package:photostock/assets/text/text_extension.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/util/extensions/extensions.dart';

/// Type of [PhotoCard] widget to create.
enum PhotoCardType {
  /// [PhotoCard] with photo only.
  empty,

  /// [PhotoCard] with all info.
  common,
}

/// [PhotoCard] widget with different ui.
abstract interface class PhotoCard extends StatelessWidget {
  /// Create an instance of [PhotoCard] of given [PhotoCardType].
  factory PhotoCard({
    required PhotoCardType photoCardType,
    required Photo photo,
    required ValueSetter<int> onTap,
    required int index,
    ValueSetter<int>? onFavoriteTap,
    bool? isFavorite,
    Key? key,
  }) {
    // Не разрешает проверять параметры в switch.
    if (onFavoriteTap != null && isFavorite != null) {
      switch (photoCardType) {
        case PhotoCardType.empty:
          return _PhotoCardEmpty(
            photo: photo,
            onTap: onTap,
            index: index,
            key: key,
          );
        case PhotoCardType.common:
          return _PhotoCardCommon(
            photo: photo,
            onTap: onTap,
            onFavoriteTap: onFavoriteTap,
            isFavorite: isFavorite,
            index: index,
            key: key,
          );
      }
    } else {
      return _PhotoCardEmpty(
        photo: photo,
        onTap: onTap,
        index: index,
        key: key,
      );
    }
  }
}

class _PhotoCardEmpty extends StatelessWidget implements PhotoCard {
  const _PhotoCardEmpty({
    required this.photo,
    required this.onTap,
    required this.index,
    super.key,
  });

  /// Photo model to show.
  final Photo photo;

  /// On tap photo action.
  final ValueSetter<int> onTap;

  /// Photo index.
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 182,
      height: 182,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          shadowColor: photo.shadowColor.toColor(),
          child: InkWell(
            onTap: () => onTap(index),
            borderRadius: BorderRadius.circular(30),
            child: ClipRRect(
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
          ),
        ),
      ),
    );
  }
}

/// Photo card widget.
class _PhotoCardCommon extends StatelessWidget implements PhotoCard {
  /// Default constructor.
  const _PhotoCardCommon({
    required this.photo,
    required this.onTap,
    required this.onFavoriteTap,
    required this.isFavorite,
    required this.index,
    super.key,
  });

  /// Photo model to show.
  final Photo photo;

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
          shadowColor: photo.shadowColor.toColor(),
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
