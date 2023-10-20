import 'package:auto_route/auto_route.dart';
import 'package:photostock/features/navigation/navigation.dart';

/// All routes for the info feature.
final photoListRoutes = AutoRoute(
  page: PhotoListRouter.page,
  path: AppRoutePaths.photoListPath,
  initial: true,
  children: const [],
);
