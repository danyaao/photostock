import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photostock/api/photo_service/photo_service.dart';
import 'package:photostock/features/app/di/app_scope.dart';
import 'package:photostock/features/common/widgets/di_scope/di_scope.dart';
import 'package:photostock/features/navigation/domain/entity/app_route_names.dart';
import 'package:photostock/features/photo/data/photo_repository/photo_repository.dart';
import 'package:photostock/features/photo/data/photo_repository/photo_repository_impl.dart';
import 'package:photostock/features/photo/screens/photo_list/photo_list.dart';
import 'package:provider/provider.dart';

/// Scope for photo repository
@RoutePage(name: AppRouteNames.photoListScreen)
class PhotoScope extends StatefulWidget {
  /// Default constructor
  const PhotoScope({
    super.key,
  });

  @override
  State<PhotoScope> createState() => _PhotoScopeState();
}

class _PhotoScopeState extends State<PhotoScope> {
  late final IPhotoRepository _photoRepository;

  IPhotoRepository get photoRepository => _photoRepository;

  @override
  void initState() {
    super.initState();
    final dio = context.read<IAppScope>().dio;
    final unsplashApi = UnsplashApi(dio);
    _photoRepository = PhotoRepository(unsplashApi: unsplashApi);
  }

  @override
  Widget build(BuildContext context) {
    return DiScope<IPhotoRepository>(
      factory: () {
        return photoRepository;
      },
      child: const PhotoListWidget(),
    );
  }
}
