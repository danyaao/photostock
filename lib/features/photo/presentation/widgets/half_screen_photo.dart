import 'package:flutter/material.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';

/// Widget for displaying big photo.
class HalfScreenPhoto extends StatelessWidget {
  /// Create an instance of [HalfScreenPhoto].
  const HalfScreenPhoto({
    required this.photo,
    super.key,
  });

  /// [Photo] to show.
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Image.network(
          photo.url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
