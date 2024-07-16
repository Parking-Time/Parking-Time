import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parking_time/config/router/routes/app_base_route.dart';
import 'package:parking_time/config/router/app_route_name.dart';
import 'package:parking_time/config/router/routes/tab_routes/favorite_route.dart';
import 'package:parking_time/config/router/routes/tab_routes/home_route.dart';
import 'package:parking_time/config/router/routes/tab_routes/profile_route.dart';

import '../../presentation/ui/main_tab/main_tab_screen.dart';

part '../router/app_router_delegate.dart';

enum BaseTab {
  homeTab,
  favoriteTab,
  profileTab;

  const BaseTab();
}

class AppRouter {
  static final router = _AppRouterDelegate._router();

  static late StatefulNavigationShell _shell;
  static final GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey();
  static final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey();
  static final GlobalKey<NavigatorState> favoriteNavigatorKey = GlobalKey();
  static final GlobalKey<NavigatorState> profileNavigatorKey = GlobalKey();

  static T getRoute<T extends AppBaseRoute<AppBaseRouteArgs>>({GlobalKey<NavigatorState>? navigatorKey}) {
    navigatorKey ??= AppRouter.globalNavigatorKey;

    if (navigatorKey == AppRouter.globalNavigatorKey) {
      return [..._AppRouterDelegate._globalRoutes, ..._AppRouterDelegate._floatingRoutes].firstWhere((element) => element.runtimeType == T) as T;
    }

    return _getTabRoute(_getTabRouteNameFromNavigatorKey(navigatorKey));
  }

  static int get currentTabIndex => _shell.currentIndex;

  static RouteMatchList get currentRouteMatchList {
    final lastMatch = AppRouter.router.routerDelegate.currentConfiguration.last;
    return lastMatch is ImperativeRouteMatch ? lastMatch.matches : AppRouter.router.routerDelegate.currentConfiguration;
  }

  static GlobalKey<NavigatorState> get currentNavigatorKey => !currentRouteMatchList
      .fullPath.contains(RegExp(r'(home|favorite|profile)'))
      ? globalNavigatorKey
      : switch (currentTabIndex) {
    0 => homeNavigatorKey,
    1 => favoriteNavigatorKey,
    2 => profileNavigatorKey,
    _ => homeNavigatorKey,
  };

  static T _getTabRoute<T extends AppBaseRoute<AppBaseRouteArgs>>(AppRouteName tabRouteName) {
    final tabRoute = _AppRouterDelegate._tabRoutes.firstWhere((element) => element.routeName == tabRouteName);
    if (tabRoute.runtimeType == T) return tabRoute as T;
    return (tabRoute.nestedRoutes ?? []).firstWhere((element) => element.runtimeType == T) as T;
  }

  static AppRouteName _getTabRouteNameFromNavigatorKey(GlobalKey<NavigatorState> key) {
    if (key == homeNavigatorKey) return AppRouteName.home;
    if (key == favoriteNavigatorKey) return AppRouteName.favorite;
    if (key == profileNavigatorKey) return AppRouteName.profile;
    return AppRouteName.home;
  }

  static void changeTab({required BaseTab tab}) {
    _shell.goBranch(tab.index);
  }

  static void clearGlobalRoute() {
    while (router.canPop()) {
      router.pop();
    }
  }
}