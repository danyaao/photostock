import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:photostock/features/photo/domain/domain.dart';
import 'package:photostock/features/photo/presentation/widgets/photo_card.dart';

/// Grid view for photo cards.
class PhotoCardGridView extends StatelessWidget {
  /// Default constructor.
  const PhotoCardGridView({
    required this.pagingController,
    required this.onRefresh,
    required this.onPhotoSelected,
    super.key,
  });

  /// Photos.
  final PagingController<int, Photo> pagingController;

  /// Refresh action.
  final VoidCallback onRefresh;

  /// Select photo action.
  final ValueSetter<int> onPhotoSelected;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        onRefresh();
      },
      child: PagedGridView<int, Photo>(
        pagingController: pagingController,
        showNewPageProgressIndicatorAsGridChild: false,
        showNewPageErrorIndicatorAsGridChild: false,
        showNoMoreItemsIndicatorAsGridChild: false,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (_, photo, index) {
            return PhotoCard(
              photo: photo,
              onTap: onPhotoSelected,
              index: index,
            );
          },
        ),
      ),
    );
  }
}
