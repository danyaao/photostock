import 'package:auto_route/auto_route.dart';
import 'package:photostock/features/navigation/navigation.dart';

/// All routes for the tabs screen.
final homeTabsRoutes = AutoRoute(
  page: HomeTabsRouter.page,
  path: AppRoutePaths.homeTabsPath,
  initial: true,
  children: [
    photoRootRoutes,
    favoriteListRoutes,
  ],
);
