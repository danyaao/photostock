import 'package:auto_route/auto_route.dart';
import 'package:photostock/features/navigation/domain/entity/app_route_paths.dart';
import 'package:photostock/features/navigation/domain/entity/photo_details/photo_details_routes.dart';
import 'package:photostock/features/navigation/service/router.dart';

/// All routes for the photo details screen.
final favoriteListRoutes = AutoRoute(
  page: FavoriteListRouter.page,
  path: AppRoutePaths.favoriteListPath,
  children: [
    photoDetailsRoutes,
  ],
);
