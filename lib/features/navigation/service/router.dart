import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/common/widgets/photo_details/photo_details.dart';
import 'package:photostock/features/favorite/presentation/screens/favorite_list/favorite_list.dart';
import 'package:photostock/features/home_tabs/presentation/screens/home_tabs/home_tabs.dart';
import 'package:photostock/features/navigation/navigation.dart';
import 'package:photostock/features/photo/di/photo_root.dart';
import 'package:photostock/features/photo/domain/domain.dart';
import 'package:photostock/features/photo/presentation/screens/photo_list/photo_list.dart';

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
        homeTabsRoutes,
      ];

  AppRouter._();

  /// Singleton instance of [AppRouter].
  factory AppRouter.instance() => _router;
}
