import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app_route_name.dart';
import 'empty_route_args.dart';
import 'app_base_route.dart';

abstract class AppBaseTabRoute extends AppBaseRoute<EmptyRouteArgs> {
  AppBaseTabRoute({required super.navigatorKey, required super.routeName, super.nestedRoutes}) : super(isGlobalRoute: true);

  @override
  Widget builder(BuildContext context, EmptyRouteArgs args) => const SizedBox();

  Widget builder2(BuildContext context);

  @override
  GoRoute routeBuilder() => GoRoute(
    path: '/${routeName.name}',
    pageBuilder: (context, state) => NoTransitionPage(child: builder2(context)),
    routes: List.generate(nestedRoutes?.length ?? 0, (index) => nestedRoutes![index].routeBuilder()),
  );

  @override
  AppBaseRoute<EmptyRouteArgs> copyWithPrefix(List<AppRouteName> newPrefixRouteNames) => this;

}