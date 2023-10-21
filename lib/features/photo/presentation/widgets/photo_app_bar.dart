import 'package:flutter/material.dart';
import 'package:photostock/assets/text/text_extension.dart';

/// Animated app bar for photo list.
class PhotoAppBar extends StatelessWidget {
  /// Default constructor.
  const PhotoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      pinned: true,
      backgroundColor: Colors.white.withOpacity(0.95),
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final top = constraints.biggest.height;
          final text = AppTextTheme.of(context);

          return FlexibleSpaceBar(
            centerTitle: true,
            title: AnimatedAlign(
              duration: const Duration(milliseconds: 500),
              alignment:
                  top > 80 ? Alignment.bottomLeft : Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(left: top > 80 ? 12 : 0),
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(microseconds: 500),
                  // TODO(me): remove hardcode.
                  child: const Text(
                    'Photos',
                  ),
                  style: top > 80
                      ? text.boldManrope.copyWith(
                          fontSize: 24,
                          color: Colors.black,
                        )
                      : text.boldManrope.copyWith(
                          fontSize: 20,
                          color: Colors.black,
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
