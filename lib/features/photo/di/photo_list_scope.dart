import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photostock/api/photo_api/photo_api.dart';
import 'package:photostock/features/app/di/app_scope.dart';
import 'package:photostock/features/common/widgets/di_scope/di_scope.dart';
import 'package:photostock/features/navigation/navigation.dart';
import 'package:photostock/features/photo/data/data.dart';
import 'package:photostock/features/photo/domain/domain.dart';
import 'package:photostock/features/photo/presentation/screens/photo_list/photo_list.dart';
import 'package:provider/provider.dart';

/// Scope for photo repository.
@RoutePage(name: AppRouteNames.photoListScreen)
class PhotoListScope extends StatefulWidget {
  /// Default constructor.
  const PhotoListScope({
    super.key,
  });

  @override
  State<PhotoListScope> createState() => _PhotoListScopeState();
}

class _PhotoListScopeState extends State<PhotoListScope> {
  late final IPhotoRepository _photoRepository;

  IPhotoRepository get photoRepository => _photoRepository;

  @override
  void initState() {
    super.initState();
    final dio = context.read<IAppScope>().dio;
    final photoApi = PhotoApi(dio);
    _photoRepository = PhotoRepository(photoApi: photoApi);
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
