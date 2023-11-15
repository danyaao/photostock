import 'package:auto_route/auto_route.dart';
import 'package:photostock/features/navigation/navigation.dart';

/// All routes for the photo details screen.
final favoriteListRoutes = AutoRoute(
  page: FavoriteListRouter.page,
  path: AppRoutePaths.favoriteListPath,
  children: [
    photoDetailsRoutes,
  ],
);
