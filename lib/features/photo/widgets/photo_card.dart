import 'package:flutter/material.dart';
import 'package:photostock/features/photo/domain_models/photo.dart';

/// Photo card widget.
class PhotoCard extends StatelessWidget {
  /// Default constructor.
  const PhotoCard({
    required this.photo,
    super.key,
  });

  /// Photo model to show
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
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
                        photo.blurHashImage,
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
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          photo.username,
                          style: text.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${photo.likesCount} likes',
                          style: text.bodySmall?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
