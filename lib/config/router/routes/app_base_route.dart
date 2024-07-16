import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app_router.dart';
import '../route_animations/bottom_to_top_route_animation.dart';
import '../route_animations/left_to_right_route_animation.dart';
import '../route_animations/no_route_animation.dart';
import '../route_animations/route_animation_type.dart';
import '../app_route_name.dart';


abstract class AppBaseRouteArgs {}

abstract class AppBaseRoute<T extends AppBaseRouteArgs> {

  final AppRouteName routeName;

  List<AppRouteName> prefixRouteNames;

  final bool isGlobalRoute;

  final GlobalKey<NavigatorState>? navigatorKey;

  final List<AppBaseRoute>? nestedRoutes;

  final RouteAnimationType routeAnimation;

  AppBaseRoute({
    required this.routeName,
    this.prefixRouteNames = const [],
    this.isGlobalRoute = false,
    this.navigatorKey,
    List<AppBaseRoute>? nestedRoutes,
    this.routeAnimation = RouteAnimationType.noAnimation,
  }) : nestedRoutes = List.generate(nestedRoutes?.length ?? 0, (index) => nestedRoutes![index].copyWithPrefix([...prefixRouteNames, routeName]));

  AppBaseRoute<T> copyWithPrefix(List<AppRouteName> newPrefixRouteNames);

  Widget builder(BuildContext context, T args);

  GoRoute routeBuilder() => GoRoute(
    path: isGlobalRoute ? '/${routeName.name}' : routeName.name,
    pageBuilder: (context, state) => switch(routeAnimation) {
      RouteAnimationType.noAnimation => NoRouteAnimation(child: builder(context, state.extra as T)),
      RouteAnimationType.leftToRight => LeftToRightRouteAnimation(child: builder(context, state.extra as T)),
      RouteAnimationType.bottomToTop => BottomToTopRouteAnimation(child: builder(context, state.extra as T)),
    },
    routes: List.generate(nestedRoutes?.length ?? 0, (index) => nestedRoutes![index].routeBuilder()),
  );

  Future<P?> push<P>(T args) async {
    if (kDebugMode) print('CURRENT PATH: ${AppRouter.currentRouteMatchList.fullPath}\nROUTE PATH: $routePath');
    return await AppRouter.router.push<P>(routePath, extra: args);
  }

  void pushReplacement<P>(T args) {
    if (kDebugMode) print('CURRENT PATH: ${AppRouter.currentRouteMatchList.fullPath}\nROUTE PATH: $routePath');
    AppRouter.router.pushReplacement(routePath, extra: args);
  }

  P getNestedRoute<P extends AppBaseRoute<AppBaseRouteArgs>>() => (nestedRoutes ?? []).firstWhere((element) => element.runtimeType == P) as P;

  String get parentRoutePath => prefixRouteNames.fold('', (p, e) => '$p/${e.name}');

  String get routePath => [...prefixRouteNames,routeName].fold('', (p, e) => '$p/${e.name}');
}