import 'package:json_annotation/json_annotation.dart';
import 'package:photostock/api/unsplash_api/unsplash_api.dart';

part 'photo_rm.g.dart';

/// Remote model for photo from Unsplash.
@JsonSerializable()
class PhotoRM {
  /// Default constructor.
  const PhotoRM({
    required this.urls,
    required this.user,
    required this.likesCount,
    required this.shadowColor,
    required this.blurHash,
  });

  /// Photo urls.
  final PhotoUrlsRM urls;

  /// User data.
  final PhotoUserRM user;

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
  factory PhotoRM.fromJson(Map<String, dynamic> json) =>
      _$PhotoRMFromJson(json);
}
