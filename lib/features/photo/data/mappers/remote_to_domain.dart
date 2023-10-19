import 'dart:typed_data';

import 'package:photostock/api/photo_api/photo_api.dart';
import 'package:photostock/features/photo/domain/domain.dart';

/// Remote to domain mapper for photo
extension PhotoRemoteToDomain on PhotoResponseDTO {
  /// Mapper method
  Future<Photo> toDomain({
    required Uint8List? blurHashImage,
  }) async {
    return Photo(
      url: urls.regular,
      username: user.username,
      likesCount: likesCount,
      shadowColor: shadowColor,
      blurHashImage: blurHashImage ?? Uint8List(0),
    );
  }
}
