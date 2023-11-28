import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/util/extensions/extensions.dart';

part 'photo_ui.freezed.dart';

/// Domain model for [PhotoUI].
@freezed
class PhotoUI with _$PhotoUI {
  /// Factory for [PhotoUI].
  const factory PhotoUI({
    required String id,
    required bool isFavorite,
    required String url,
    required String username,
    required int likesCount,
    required Color shadowColor,
    required Uint8List blurHash,
    String? note,
  }) = _PhotoUI;
}

/// [PhotoUI] from [Photo] adapter.
class PhotoUIAdapter {
  /// Get [PhotoUI].
  PhotoUI call({
    required Photo photo,
  }) {
    return PhotoUI(
      id: photo.id,
      isFavorite: photo.isFavorite,
      url: photo.url,
      username: photo.username,
      likesCount: photo.likesCount,
      shadowColor: photo.shadowColor.toColor() ?? Colors.white,
      blurHash: photo.blurHash,
      note: photo.note,
    );
  }
}
