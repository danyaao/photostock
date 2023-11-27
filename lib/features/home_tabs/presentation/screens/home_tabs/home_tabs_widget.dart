import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:photostock/features/home_tabs/presentation/screens/home_tabs/home_tabs.dart';
import 'package:photostock/features/navigation/domain/entity/app_route_names.dart';

/// Elementary widget for HomeTabs screen.
@RoutePage(name: AppRouteNames.homeTabsScreen)
class HomeTabsWidget extends ElementaryWidget<IHomeTabsWidgetModel> {
  /// Create an instance of [HomeTabsWidget].
  const HomeTabsWidget({
    Key? key,
    WidgetModelFactory widgetModelFactory = createHomeTabsWidgetModel,
  }) : super(widgetModelFactory, key: key);

  @override
  Widget build(IHomeTabsWidgetModel wm) {
    return AutoTabsRouter.tabBar(
      routes: wm.routes,
      builder: (context, child, controller) {
        final tabsRouter = context.tabsRouter;

        return Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 600;

              final height = constraints.maxHeight;
              final width = constraints.maxWidth;

              late final double navigationRailWidth;

              if (constraints.maxWidth - 600 < 50) {
                navigationRailWidth = 50;
              } else if (constraints.maxWidth - 600 > 150) {
                navigationRailWidth = 150;
              } else {
                navigationRailWidth = constraints.maxWidth - 600;
              }

              return Stack(
                children: [
                  Align(
                    alignment:
                        isWide ? Alignment.centerRight : Alignment.topCenter,
                    child: SizedBox(
                        width: isWide ? width - navigationRailWidth : width,
                        height: isWide ? height - 50 : height,
                        child: child),
                  ),
                  Align(
                    alignment:
                        isWide ? Alignment.centerLeft : Alignment.bottomCenter,
                    child: isWide
                        ? SizedBox(
                            width: navigationRailWidth,
                            height: height,
                            child: NavigationRail(
                              extended: constraints.maxWidth - 600 > 130,
                              backgroundColor: Colors.grey.shade300,
                              destinations: wm.navigationRailDestinations,
                              selectedIndex: tabsRouter.activeIndex,
                              onDestinationSelected: tabsRouter.setActiveIndex,
                              minWidth: 50,
                            ),
                          )
                        : NavigationBar(
                            backgroundColor: Colors.grey.shade300,
                            destinations: wm.navigationDestinations,
                            selectedIndex: tabsRouter.activeIndex,
                            onDestinationSelected: tabsRouter.setActiveIndex,
                            height: 50,
                          ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
