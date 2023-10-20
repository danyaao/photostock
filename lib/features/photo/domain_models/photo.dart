import 'dart:typed_data';
import 'dart:ui';

/// Domain model for photo from Unsplash
class Photo {
  /// Default constructor.
  const Photo({
    required this.url,
    required this.username,
    required this.likesCount,
    required this.shadowColor,
    required this.blurHashImage,
  });

  /// Photo url.
  final String url;

  /// Username.
  final String username;

  /// Count of likes on photo.
  final int likesCount;

  /// Color of shadow for photo.
  final Color shadowColor;

  /// Blur hash image to show while photo is loading.
  final Uint8List blurHashImage;
}
