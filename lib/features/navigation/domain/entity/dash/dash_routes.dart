import 'package:auto_route/auto_route.dart';
import 'package:photostock/features/navigation/domain/entity/app_route_paths.dart';
import 'package:photostock/features/navigation/service/router.dart';

/// All routes for the dash feature.
final dashRoutes = AutoRoute(
  page: DashRouter.page,
  path: AppRoutePaths.dashPath,
);
