import 'package:json_annotation/json_annotation.dart';

part 'photo_response_dto.g.dart';

/// Remote model for photo from Unsplash.
@JsonSerializable()
class PhotoResponseDTO {
  /// Default constructor.
  const PhotoResponseDTO({
    required this.urls,
    required this.user,
    required this.likesCount,
    required this.shadowColor,
    required this.blurHash,
  });

  /// Photo urls.
  final PhotoUrlsResponseDTO urls;

  /// User data.
  final PhotoUserResponseDTO user;

  /// Count of likes on photo.
  @JsonKey(name: 'likes')
  final int likesCount;

  /// Color of shadow for photo.
  @JsonKey(name: 'color')
  final String shadowColor;

  /// Blur hash to show while photo is loading.
  @JsonKey(name: 'blur_hash')
  final String blurHash;

  ///From json method.
  factory PhotoResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$PhotoResponseDTOFromJson(json);
}

/// Remote model for photo url.
@JsonSerializable()
class PhotoUrlsResponseDTO {
  /// Default constructor.
  const PhotoUrlsResponseDTO({
    required this.regular,
  });

  /// Url for regular photo.
  final String regular;

  /// From json method.
  factory PhotoUrlsResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$PhotoUrlsResponseDTOFromJson(json);
}

/// Remote model for user from photo.
@JsonSerializable()
class PhotoUserResponseDTO {
  /// Default constructor.
  const PhotoUserResponseDTO({
    required this.username,
  });

  /// Username.
  final String username;

  /// From json method.
  factory PhotoUserResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$PhotoUserResponseDTOFromJson(json);
}
