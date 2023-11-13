import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/app/di/app_scope.dart';
import 'package:photostock/features/common/widgets/di_scope/di_scope.dart';
import 'package:photostock/features/navigation/navigation.dart';
import 'package:photostock/features/photo/di/photo_scope.dart';
import 'package:photostock/features/photo/presentation/screens/photo_list/photo_list.dart';

///  for photo repository.
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
    _photoScope = PhotoScope(dio: dio);
  }

  @override
  Widget build(BuildContext context) {
    return DiScope<IPhotoScope>(
      factory: () => _photoScope,
      child: const PhotoListWidget(),
    );
  }
}
