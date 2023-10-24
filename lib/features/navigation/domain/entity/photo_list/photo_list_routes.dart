import 'package:auto_route/auto_route.dart';
import 'package:photostock/features/navigation/navigation.dart';

/// All routes for the photo list screen.
final photoListRoutes = AutoRoute(
  page: PhotoListRouter.page,
  path: AppRoutePaths.photoListPath,
);
