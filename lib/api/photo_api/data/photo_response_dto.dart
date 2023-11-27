import 'package:json_annotation/json_annotation.dart';

part 'photo_response_dto.g.dart';

/// [PhotoResponseDTO] for photo from unsplash.com
@JsonSerializable()
class PhotoResponseDTO {
  /// Create an instance of [PhotoResponseDTO].
  const PhotoResponseDTO({
    required this.id,
    required this.urls,
    required this.user,
    required this.likesCount,
    required this.shadowColor,
    required this.blurHash,
  });

  /// Photo id from unsplash.com.
  final String id;

  /// Photo urls (different resolutions).
  final PhotoUrlResponseDTO urls;

  /// Photo author's username.
  final PhotoUserResponseDTO user;

  /// Photo count of likes.
  @JsonKey(name: 'likes')
  final int likesCount;

  /// Photo color of shadow.
  @JsonKey(name: 'color')
  final String shadowColor;

  /// Photo blurhash to show while loading.
  @JsonKey(name: 'blur_hash')
  final String blurHash;

  /// Create [PhotoResponseDTO] from JSON.
  factory PhotoResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$PhotoResponseDTOFromJson(json);
}

/// [PhotoUrlResponseDTO] for photo url.
@JsonSerializable()
class PhotoUrlResponseDTO {
  /// Create an instance of [PhotoUrlResponseDTO].
  const PhotoUrlResponseDTO({
    required this.regular,
  });

  /// Photo url of regular size.
  final String regular;

  /// Create [PhotoUrlResponseDTO] from JSON.
  factory PhotoUrlResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$PhotoUrlResponseDTOFromJson(json);
}

/// [PhotoUserResponseDTO] for user from photo.
@JsonSerializable()
class PhotoUserResponseDTO {
  /// Create an instance of [PhotoUserResponseDTO].
  const PhotoUserResponseDTO({
    required this.username,
  });

  /// Photo author's username.
  final String username;

  /// Create [PhotoUserResponseDTO] from JSON.
  factory PhotoUserResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$PhotoUserResponseDTOFromJson(json);
}
