import 'package:auto_route/auto_route.dart';
import 'package:photostock/features/navigation/navigation.dart';

/// All routes for the info feature.
final photoDetailsRoutes = AutoRoute(
  page: PhotoDetailsRouter.page,
  path: AppRoutePaths.photoDetailsPath,
);
