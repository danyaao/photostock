import 'package:flutter/material.dart';
import 'package:photostock/api/photo_api/photo_api.dart';
import 'package:photostock/features/app/di/app_scope.dart';
import 'package:photostock/features/photo/data/photo_repository/photo_repository_impl.dart';
import 'package:photostock/features/photo/domain/domain.dart';
import 'package:provider/provider.dart';

/// Photo list dependencies.
abstract interface class IPhotoListScope {
  /// Repository for loading photos.
  IPhotoRepository get photoRepository;
}

/// Photo list dependencies.
class PhotoListScope implements IPhotoListScope {
  /// Create an instance of [PhotoListScope].
  PhotoListScope({required BuildContext context}) {
    final dio = context.read<IAppScope>().dio;
    final photoApi = PhotoApi(dio);
    _photoRepository = PhotoRepository(photoApi: photoApi);
  }

  late final IPhotoRepository _photoRepository;

  @override
  IPhotoRepository get photoRepository => _photoRepository;
}
