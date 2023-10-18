import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/dash/screen/dash_screen_export.dart';
import 'package:photostock/features/debug/screens/debug_screen/debug_screen_export.dart';
import 'package:photostock/features/debug/screens/log_history_screen/log_history_export.dart';
import 'package:photostock/features/debug/screens/ui_kit_screen/ui_kit_screen_export.dart';
import 'package:photostock/features/info/screen/info_screen_export.dart';
import 'package:photostock/features/navigation/domain/entity/log_history/log_history_routes.dart';
import 'package:photostock/features/navigation/domain/entity/photo_list/photo_list_routes.dart';
import 'package:photostock/features/navigation/domain/entity/ui_kit/ui_kit_routes.dart';
import 'package:photostock/features/photo/screens/photo_list/photo_list.dart';

part 'router.gr.dart';

/// When you add route with screen don't forget add imports of screen and screen_widget_model

/// Main point of the application navigation

@AutoRouterConfig(
  replaceInRouteName: 'ScreenWidget|Screen|Widget,Route',
)
class AppRouter extends _$AppRouter {
  static final AppRouter _router = AppRouter._();

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        photoListRoutes,
        logHistoryRoutes,
        uiKitRoutes,
      ];

  AppRouter._();

  /// Singleton instance of [AppRouter].
  factory AppRouter.instance() => _router;
}
