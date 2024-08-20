import 'package:flutter/material.dart';
import 'package:parking_time/presentation/ui/admin/admin_screen.dart';

import '../../app_route_name.dart';
import '../app_base_route.dart';

class CreateParkingLotArgs extends AppBaseRouteArgs {}

class CreateParkingLotRoute extends AppBaseRoute<CreateParkingLotArgs> {
  CreateParkingLotRoute({super.isGlobalRoute, super.prefixRouteNames, super.nestedRoutes}) : super(
    routeName: AppRouteName.createParkingLot,
  );

  @override
  Widget builder(BuildContext context, CreateParkingLotArgs args) => const AdminScreen();

  @override
  AppBaseRoute<CreateParkingLotArgs> copyWithPrefix(List<AppRouteName> newPrefixRouteNames) => CreateParkingLotRoute(
      isGlobalRoute: isGlobalRoute,
      nestedRoutes: nestedRoutes,
      prefixRouteNames: newPrefixRouteNames
  );

}