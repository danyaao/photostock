import 'package:json_annotation/json_annotation.dart';

part 'photo_urls_rm.g.dart';

/// Remote model for photo url.
@JsonSerializable()
class PhotoUrlsRM {
  /// Default constructor.
  const PhotoUrlsRM({
    required this.regular,
  });

  /// Url for regular photo.
  final String regular;

  /// From json method.
  factory PhotoUrlsRM.fromJson(Map<String, dynamic> json) =>
      _$PhotoUrlsRMFromJson(json);
}
