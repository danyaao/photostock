import 'dart:typed_data';

import 'package:photostock/api/photo_api/data/photo_response_dto.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/persistence/storage/photo_storage/photo_storage.dart';

/// Mapper for [PhotoResponseDTO].
extension PhotoRemoteToDomain on PhotoResponseDTO {
  /// Map [PhotoResponseDTO] to [Photo].
  Photo toDomain({
    required Uint8List? blurHash,
  }) {
    return Photo(
      id: id,
      isFavorite: false,
      url: urls.regular,
      username: user.username,
      likesCount: likesCount,
      shadowColor: shadowColor,
      blurHash: blurHash ?? Uint8List(0),
    );
  }
}

/// Mapper for [StoredPhoto].
extension PhotoStoredToDomain on StoredPhoto {
  /// Map [StoredPhoto] to [Photo].
  Photo toDomain() {
    return Photo(
      id: id,
      isFavorite: true,
      url: url,
      username: username,
      likesCount: likesCount,
      shadowColor: shadowColor,
      blurHash: blurHash,
      note: note,
    );
  }
}
