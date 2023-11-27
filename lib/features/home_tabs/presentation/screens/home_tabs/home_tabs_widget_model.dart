import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/home_tabs/presentation/screens/home_tabs/home_tabs.dart';
import 'package:photostock/features/navigation/service/router.dart';

/// Interface of [HomeTabsWidgetModel].
abstract interface class IHomeTabsWidgetModel implements IWidgetModel {
  /// Get routes method.
  List<PageRouteInfo> get routes;

  /// List of items for navigation bar.
  List<NavigationDestination> get navigationDestinations;

  /// List of items for navigation rail.
  List<NavigationRailDestination> get navigationRailDestinations;
}

/// Widget model for HomeTabs screen.
class HomeTabsWidgetModel extends WidgetModel<HomeTabsWidget, IHomeTabsModel>
    implements IHomeTabsWidgetModel {
  /// Create an instance of [HomeTabsWidgetModel].
  HomeTabsWidgetModel(super._model);

  final _routes = <PageRouteInfo>[
    PhotoListRouter(),
    FavoriteListRouter(),
  ];

  @override
  List<PageRouteInfo> get routes => _routes;

  @override
  List<NavigationDestination> get navigationDestinations => [
        for (final navigationItem in NavigationItem.values)
          navigationItem.toNavigationDestination()
      ];

  @override
  List<NavigationRailDestination> get navigationRailDestinations => [
        for (final navigationItem in NavigationItem.values)
          navigationItem.toNavigationRailDestination()
      ];
}

/// Factory for [HomeTabsWidgetModel].
HomeTabsWidgetModel createHomeTabsWidgetModel(
  BuildContext context,
) {
  final model = HomeTabsModel();

  return HomeTabsWidgetModel(model);
}

/// Navigation items for navigation destinations.
enum NavigationItem {
  /// Photo navigation item.
  photo(
    icon: Icon(Icons.photo_outlined),
    selectedIcon: Icon(Icons.photo),
    label: 'Photos',
  ),

  /// Favorite navigation item.
  favorite(
    icon: Icon(Icons.favorite_outline),
    selectedIcon: Icon(Icons.favorite),
    label: 'Favorites',
  );

  const NavigationItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });

  /// Item's icon.
  final Icon icon;

  /// Item's unselected icon.
  final Icon selectedIcon;

  /// Item's text label.
  final String label;

  /// Map [NavigationItem] to [NavigationDestination].
  NavigationDestination toNavigationDestination() {
    return NavigationDestination(
      icon: icon,
      selectedIcon: selectedIcon,
      label: '',
    );
  }

  /// Map [NavigationItem] to [NavigationRailDestination].
  NavigationRailDestination toNavigationRailDestination() {
    return NavigationRailDestination(
        icon: icon, selectedIcon: selectedIcon, label: Text(label));
  }
}
