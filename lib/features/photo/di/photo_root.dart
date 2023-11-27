import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photostock/api/photo_api/service/photo_api.dart';
import 'package:photostock/core/di/di_scope.dart';
import 'package:photostock/core/di/inherited_container.dart';
import 'package:photostock/features/app/di/app_scope.dart';
import 'package:photostock/features/home_tabs/presentation/screens/home_tabs/home_tabs_widget.dart';
import 'package:photostock/features/navigation/domain/entity/app_route_names.dart';
import 'package:photostock/features/photo/data/repository/photo_api_repository_impl.dart';
import 'package:photostock/features/photo/data/repository/photo_storage_repository_impl.dart';
import 'package:photostock/features/photo/di/photo_scope.dart';

/// Photo root widget with access for [PhotoScope] dependencies.
@RoutePage(name: AppRouteNames.photoRootScreen)
class PhotoRoot extends StatefulWidget {
  /// Default constructor.
  const PhotoRoot({
    super.key,
  });

  @override
  State<PhotoRoot> createState() => _PhotoRootState();
}

class _PhotoRootState extends State<PhotoRoot> {
  late final IPhotoScope _photoScope;

  @override
  void initState() {
    super.initState();
    final appScope = InheritedContainer.read<IAppScope>(context);

    final dio = appScope.dio;
    final photoApi = PhotoApi(dio);
    final photoApiRepository = PhotoApiRepository(photoApi: photoApi);

    final photoStorage = appScope.photoStorage;
    final photoStorageRepository =
        PhotoStorageRepository(photoStorage: photoStorage);

    _photoScope = PhotoScope(
      photoApiRepository: photoApiRepository,
      photoStorageRepository: photoStorageRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DiScope<IPhotoScope>(
      factory: () => _photoScope,
      child: const HomeTabsWidget(),
    );
  }
}
