import 'package:flutter/material.dart';
import 'package:photostock/features/photo/domain/domain.dart';
import 'package:photostock/features/photo/presentation/widgets/widgets.dart';

/// Grid view for photo cards.
class PhotoCardGridView extends StatelessWidget {
  /// Default constructor.
  const PhotoCardGridView({
    required this.photos,
    required this.onRefresh,
    required this.onPhotoSelected,
    super.key,
  });

  /// Photos.
  final List<Photo> photos;

  /// Refresh action
  final VoidCallback onRefresh;

  /// Select photo action
  final ValueSetter<int> onPhotoSelected;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        onRefresh();
      },
      child: GridView.builder(
        itemCount: photos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              onPhotoSelected(index);
            },
            borderRadius: BorderRadius.circular(30),
            child: PhotoCard(
              photo: photos[index],
            ),
          );
        },
      ),
    );
  }
}
