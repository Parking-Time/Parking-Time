import 'package:flutter/material.dart';
import 'package:parking_time/presentation/ui/admin/admin_screen.dart';

import '../../app_route_name.dart';
import '../app_base_route.dart';

class AdminRouteArgs extends AppBaseRouteArgs {}

class AdminRoute extends AppBaseRoute<AdminRouteArgs> {
  AdminRoute({super.isGlobalRoute, super.prefixRouteNames, super.nestedRoutes}) : super(
    routeName: AppRouteName.admin,
  );

  @override
  Widget builder(BuildContext context, AdminRouteArgs args) => const AdminScreen();

  @override
  AppBaseRoute<AdminRouteArgs> copyWithPrefix(List<AppRouteName> newPrefixRouteNames) => AdminRoute(
      isGlobalRoute: isGlobalRoute,
      nestedRoutes: nestedRoutes,
      prefixRouteNames: newPrefixRouteNames
  );

}