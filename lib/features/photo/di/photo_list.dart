import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/common/widgets/di_scope/di_scope.dart';
import 'package:photostock/features/navigation/navigation.dart';
import 'package:photostock/features/photo/di/photo_list_scope.dart';
import 'package:photostock/features/photo/presentation/screens/photo_list/photo_list.dart';

///  for photo repository.
@RoutePage(name: AppRouteNames.photoListScreen)
class PhotoList extends StatefulWidget {
  /// Default constructor.
  const PhotoList({
    super.key,
  });

  @override
  State<PhotoList> createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  late final IPhotoListScope _photoListScope;

  @override
  void initState() {
    super.initState();
    _photoListScope = PhotoListScope(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return DiScope<IPhotoListScope>(
      factory: () {
        return _photoListScope;
      },
      child: const PhotoListWidget(),
    );
  }
}
