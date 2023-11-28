import 'package:auto_route/auto_route.dart';
import 'package:photostock/features/navigation/domain/entity/app_route_paths.dart';
import 'package:photostock/features/navigation/domain/entity/home_tabs/home_tabs_routes.dart';
import 'package:photostock/features/navigation/service/router.dart';

/// All routes for the photo root screen.
final photoRootRoutes = AutoRoute(
  page: PhotoRootRouter.page,
  path: AppRoutePaths.photoRootPath,
  initial: true,
  children: [
    homeTabsRoutes,
  ],
);
