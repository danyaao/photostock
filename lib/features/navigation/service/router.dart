import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/navigation/domain/entity/photo_details/photo_details_routes.dart';
import 'package:photostock/features/navigation/navigation.dart';
import 'package:photostock/features/photo/di/photo_list.dart';
import 'package:photostock/features/photo/domain/domain.dart';
import 'package:photostock/features/photo/presentation/screens/photo_details/photo_details_screen.dart';

part 'router.gr.dart';

/// When you add route with screen don't forget add imports of screen and screen_widget_model

/// Main point of the application navigation

@AutoRouterConfig(
  replaceInRouteName: 'Widget,Route',
)
class AppRouter extends _$AppRouter {
  static final AppRouter _router = AppRouter._();

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        photoListRoutes,
        photoDetailsRoutes,
      ];

  AppRouter._();

  /// Singleton instance of [AppRouter].
  factory AppRouter.instance() => _router;
}
