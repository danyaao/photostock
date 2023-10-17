import 'package:json_annotation/json_annotation.dart';

part 'photo_user_rm.g.dart';

/// Remote model for user from photo.
@JsonSerializable()
class PhotoUserRM {
  /// Default constructor.
  const PhotoUserRM({
    required this.username,
  });

  /// Username.
  final String username;

  /// From json method.
  factory PhotoUserRM.fromJson(Map<String, dynamic> json) =>
      _$PhotoUserRMFromJson(json);
}
