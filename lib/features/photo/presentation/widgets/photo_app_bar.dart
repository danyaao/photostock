import 'package:flutter/material.dart';

/// Animated app bar for photo list.
class PhotoAppBar extends StatelessWidget {
  /// Default constructor.
  const PhotoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return SliverAppBar(
      elevation: 10,
      automaticallyImplyLeading: false,
      expandedHeight: 60,
      toolbarHeight: 30,
      collapsedHeight: 30,
      floating: true,
      snap: true,
      flexibleSpace: LayoutBuilder(
        builder: (_, __) {
          return FlexibleSpaceBar(
            centerTitle: true,
            title: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: 1,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'Photos',
                    style: text.titleSmall,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
