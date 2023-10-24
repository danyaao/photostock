import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/photo/data/photo_repository/photo_repository.dart';
import 'package:photostock/features/photo/domain_models/photo.dart';

/// Default Elementary model for PhotoList module
class PhotoListModel extends ElementaryModel {
  /// Default constructor
  PhotoListModel({
    required IPhotoRepository photoRepository,
  }) : _photoRepository = photoRepository;

  final IPhotoRepository _photoRepository;

  /// Photos
  final ValueNotifier<List<Photo>> photos = ValueNotifier([]);

  /// Load photos method
  Future<void> getPhotos() async {
    photos.value = await _photoRepository.getPhotosFromNetwork();
  }
}
