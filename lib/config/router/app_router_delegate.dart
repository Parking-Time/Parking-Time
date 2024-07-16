part of '../router/app_router.dart';

class _AppRouterDelegate {

  static final List<AppBaseRoute> _tabRoutes = [
    HomeRoute(navigatorKey: AppRouter.homeNavigatorKey),
    FavoriteRoute(navigatorKey: AppRouter.favoriteNavigatorKey),
    ProfileRoute(navigatorKey: AppRouter.profileNavigatorKey),
  ];

  static final List<AppBaseRoute> _globalRoutes = [
  ];

  static final List<AppBaseRoute> _floatingRoutes = [
  ];

  static GoRouter _router() {
    assert(_tabRoutes.where((element) => element.navigatorKey == null).isEmpty, 'The navigatorKey of _tabRoutes cannot be null.');
    assert(_globalRoutes.where((element) => !element.isGlobalRoute).isEmpty, 'The isGlobalRoute of _globalRoutes must be true.');
    assert(_floatingRoutes.where((element) => !element.isGlobalRoute).isEmpty, 'The isGlobalRoute of _dialogRoutes must be true.');


    return GoRouter(
      navigatorKey: AppRouter.globalNavigatorKey,
      initialLocation: '/${AppRouteName.home.name}',
      redirect: (context, state) {
        return null;
      },
      routes: [
        ..._convertToRouteBase(_globalRoutes),
        ..._convertToRouteBase(_floatingRoutes),
        StatefulShellRoute.indexedStack(
          parentNavigatorKey: AppRouter.globalNavigatorKey,
          branches: List.generate(_tabRoutes.length, (index) => StatefulShellBranch(
            routes: [_tabRoutes[index].routeBuilder()],
            navigatorKey: _tabRoutes[index].navigatorKey,
          )),
          builder: (context, state, navigationShell) {
            AppRouter._shell = navigationShell;
            return MainTabScreen(navigationShell: navigationShell);
          },
        ),
      ],
    );
  }

  static List<GoRoute> _convertToRouteBase(List<AppBaseRoute> routes) =>
      List.generate(routes.length, (index) => routes[index].routeBuilder());
}
