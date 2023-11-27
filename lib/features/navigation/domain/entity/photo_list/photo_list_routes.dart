import 'package:auto_route/auto_route.dart';
import 'package:photostock/features/navigation/domain/entity/app_route_paths.dart';
import 'package:photostock/features/navigation/domain/entity/photo_details/photo_details_routes.dart';
import 'package:photostock/features/navigation/service/router.dart';

/// All routes for the photo list screen.
final photoListRoutes = AutoRoute(
  page: PhotoListRouter.page,
  path: AppRoutePaths.photoListPath,
  children: [
    photoDetailsRoutes,
  ],
);
