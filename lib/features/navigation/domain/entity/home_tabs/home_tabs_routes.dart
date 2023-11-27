import 'package:auto_route/auto_route.dart';
import 'package:photostock/features/navigation/domain/entity/app_route_paths.dart';
import 'package:photostock/features/navigation/domain/entity/favorite_list/favorite_list_routes.dart';
import 'package:photostock/features/navigation/domain/entity/photo_list/photo_list_routes.dart';
import 'package:photostock/features/navigation/service/router.dart';

/// All routes for the tabs screen.
final homeTabsRoutes = AutoRoute(
  page: HomeTabsRouter.page,
  path: AppRoutePaths.homeTabsPath,
  children: [
    photoListRoutes,
    favoriteListRoutes,
  ],
);
