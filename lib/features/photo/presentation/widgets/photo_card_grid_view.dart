import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photostock/features/photo/domain/domain.dart';
import 'package:photostock/features/photo/presentation/widgets/widgets.dart';

/// Grid view for photo cards.
class PhotoCardGridView extends StatelessWidget {
  /// Default constructor.
  const PhotoCardGridView({
    required this.photos,
    required this.onRefresh,
    required this.onPhotoSelected,
    required this.scrollController,
    super.key,
  });

  /// Photos.
  final List<Photo> photos;

  /// Refresh action.
  final VoidCallback onRefresh;

  /// Select photo action.
  final ValueSetter<int> onPhotoSelected;

  /// Scroll controller.
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        onRefresh();
      },
      child: GridView.builder(
        itemCount: photos.length + 1,
        controller: scrollController,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement(
          crossAxisCount: 2,
          itemCount: photos.length + 1,
        ),
        itemBuilder: (context, index) {
          if (index < photos.length) {
            return InkWell(
              onTap: () {
                onPhotoSelected(index);
              },
              borderRadius: BorderRadius.circular(30),
              child: PhotoCard(
                photo: photos[index],
              ),
            );
          } else {
            return const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 40),
                child: SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

// Не уверен, куда стоит поместить эту штуку, поэтому пока оставил здесь
/// Custom sliver grid.
class SliverGridWithCustomGeometryLayout extends SliverGridRegularTileLayout {
  /// Default constructor.
  const SliverGridWithCustomGeometryLayout({
    required this.geometryBuilder,
    required super.crossAxisCount,
    required super.mainAxisStride,
    required super.crossAxisStride,
    required super.childMainAxisExtent,
    required super.childCrossAxisExtent,
    required super.reverseCrossAxis,
  });

  /// The builder for each child geometry.
  final SliverGridGeometry Function(
    int index,
    SliverGridRegularTileLayout layout,
  ) geometryBuilder;

  @override
  SliverGridGeometry getGeometryForChildIndex(int index) {
    return geometryBuilder(index, this);
  }
}

/// Custom sliver grid delegate with centralized last element
class SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement
    extends SliverGridDelegateWithFixedCrossAxisCount {
  /// The total number of items in the layout.
  final int itemCount;

  /// Default constructor.
  SliverGridDelegateWithFixedCrossAxisCountAndCentralizedLastElement({
    required this.itemCount,
    required super.crossAxisCount,
    super.mainAxisSpacing,
    super.crossAxisSpacing,
    super.childAspectRatio,
  });

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    final usableCrossAxisExtent = max(
      0,
      constraints.crossAxisExtent - crossAxisSpacing * (crossAxisCount - 1),
    );
    final childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
    final childMainAxisExtent = childCrossAxisExtent / childAspectRatio;
    return SliverGridWithCustomGeometryLayout(
      geometryBuilder: (index, layout) {
        return SliverGridGeometry(
          scrollOffset: (index ~/ crossAxisCount) * layout.mainAxisStride,
          crossAxisOffset: itemCount.isOdd && index == itemCount - 1
              ? layout.crossAxisStride / 2
              : _getOffsetFromStartInCrossAxis(index, layout),
          mainAxisExtent: childMainAxisExtent,
          crossAxisExtent: childCrossAxisExtent,
        );
      },
      crossAxisCount: crossAxisCount,
      mainAxisStride: childMainAxisExtent + mainAxisSpacing,
      crossAxisStride: childCrossAxisExtent + crossAxisSpacing,
      childMainAxisExtent: childMainAxisExtent,
      childCrossAxisExtent: childCrossAxisExtent,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  double _getOffsetFromStartInCrossAxis(
    int index,
    SliverGridRegularTileLayout layout,
  ) {
    final crossAxisStart = (index % crossAxisCount) * layout.crossAxisStride;

    if (layout.reverseCrossAxis) {
      return crossAxisCount * layout.crossAxisStride -
          crossAxisStart -
          layout.childCrossAxisExtent -
          (layout.crossAxisStride - layout.childCrossAxisExtent);
    }
    return crossAxisStart;
  }
}
