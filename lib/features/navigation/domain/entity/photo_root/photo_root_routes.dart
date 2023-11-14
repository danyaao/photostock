import 'package:auto_route/auto_route.dart';
import 'package:photostock/features/navigation/navigation.dart';

/// All routes for the photo root screen.
final photoRootRoutes = AutoRoute(
  page: PhotoRootRouter.page,
  path: AppRoutePaths.photoRootPath,
  children: [
    photoListRoutes,
  ],
);
