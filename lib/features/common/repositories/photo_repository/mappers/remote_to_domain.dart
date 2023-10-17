import 'dart:ui';

import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:photostock/api/unsplash_api/unsplash_api.dart';
import 'package:photostock/features/common/domain_models/domain_models.dart';

/// Remote to domain mapper for photo
extension PhotoRemoteToDomain on PhotoRM {
  /// Mapper method
  Future<Photo> toDomain() async {
    final blueHashImage = await blurHashDecode(
      blurHash: blurHash,
      width: 100,
      height: 100,
    );

    return Photo(
      url: urls.regular,
      username: user.username,
      likesCount: likesCount,
      shadowColor: Color(
        int.parse(shadowColor.substring(1, 7), radix: 16) + 0xFF000000,
      ),
      blurHashImage: blueHashImage,
    );
  }
}
