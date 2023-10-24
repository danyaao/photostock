import 'dart:typed_data';
import 'dart:ui';

import 'package:blurhash/blurhash.dart';
import 'package:photostock/api/photo_service/photo_service.dart';
import 'package:photostock/features/photo/domain_models/photo.dart';

/// Remote to domain mapper for photo
extension PhotoRemoteToDomain on PhotoResponseDTO {
  /// Mapper method
  Future<Photo> toDomain() async {
    final blurHashImage =
        await BlurHash.decode(blurHash, 158, 158) ?? Uint8List(100);

    return Photo(
      url: urls.regular,
      username: user.username,
      likesCount: likesCount,
      shadowColor: Color(
        int.parse(shadowColor.substring(1, 7), radix: 16) + 0xFF000000,
      ),
      blurHashImage: blurHashImage,
    );
  }
}
