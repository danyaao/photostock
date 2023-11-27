import 'package:flutter/material.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';

/// Widget for favorite button.
class FavoriteButton extends StatelessWidget {
  /// Create an instance of [FavoriteButton].
  const FavoriteButton({
    required this.isFavorite,
    required this.onTap,
    super.key,
  });

  /// Flag to change icon.
  final bool isFavorite;

  /// Favorite/unfavorite [Photo].
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_outline,
          size: 40,
          color: isFavorite ? Colors.red.shade300 : Colors.black,
        ),
      ),
    );
  }
}
