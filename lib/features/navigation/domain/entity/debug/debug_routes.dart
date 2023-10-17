import 'package:auto_route/auto_route.dart';
import 'package:photostock/features/navigation/domain/entity/app_route_paths.dart';
import 'package:photostock/features/navigation/service/router.dart';

/// All routes for the debug feature.
final debugRoutes = AutoRoute(
  page: DebugRouter.page,
  path: AppRoutePaths.debugPath,
);
