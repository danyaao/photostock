import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/home_tabs/presentation/screens/home_tabs/home_tabs_widget.dart';
import 'package:photostock/features/home_tabs/presentation/screens/home_tabs/home_tabs_widget_model.dart';
import 'package:photostock/features/navigation/domain/entity/photo_root/photo_root_routes.dart';
import 'package:photostock/features/photo/di/photo_root.dart';
import 'package:photostock/features/photo/domain/entity/photo.dart';
import 'package:photostock/features/photo/presentation/screens/favorite_list/favorite_list_widget.dart';
import 'package:photostock/features/photo/presentation/screens/favorite_list/favorite_list_widget_model.dart';
import 'package:photostock/features/photo/presentation/screens/photo_details/photo_details_widget.dart';
import 'package:photostock/features/photo/presentation/screens/photo_details/photo_details_widget_model.dart';
import 'package:photostock/features/photo/presentation/screens/photo_list/photo_list_widget.dart';
import 'package:photostock/features/photo/presentation/screens/photo_list/photo_list_widget_model.dart';

part 'router.gr.dart';

/// When you add route with screen don't forget add imports of screen and screen_widget_model

/// Main point of the application navigation

@AutoRouterConfig(
  replaceInRouteName: 'Widget,Route',
)
class AppRouter extends _$AppRouter {
  static final AppRouter _router = AppRouter._();

  @override
  List<AutoRoute> get routes => [
        photoRootRoutes,
      ];

  AppRouter._();

  /// Singleton instance of [AppRouter].
  factory AppRouter.instance() => _router;
}
