import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';

/// Domain model for [Photo].
@freezed
class Photo with _$Photo {
  /// Factory for [Photo].
  const factory Photo({
    required String id,
    required bool isFavorite,
    required String url,
    required String username,
    required int likesCount,
    required String shadowColor,
    required Uint8List blurHash,
    String? note,
  }) = _Photo;
}
