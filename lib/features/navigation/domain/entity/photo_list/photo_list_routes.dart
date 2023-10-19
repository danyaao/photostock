import 'package:auto_route/auto_route.dart';
import 'package:photostock/features/navigation/domain/entity/app_route_paths.dart';
import 'package:photostock/features/navigation/domain/entity/dash/dash_routes.dart';
import 'package:photostock/features/navigation/domain/entity/debug/debug_routes.dart';
import 'package:photostock/features/navigation/domain/entity/info/info_routes.dart';
import 'package:photostock/features/navigation/service/router.dart';

/// All routes for the info feature.
final photoListRoutes = AutoRoute(
  page: PhotoListRouter.page,
  path: AppRoutePaths.photoListPath,
  initial: true,
  children: [
    dashRoutes,
    infoRoutes,
    debugRoutes,
  ],
);
