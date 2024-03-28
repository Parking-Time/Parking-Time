import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:parking_time/common/route/route.dart';
import 'package:parking_time/common/route/route_name.dart';
import 'package:parking_time/presentation/screens/edit_parking_lot_screen.dart';
import 'package:parking_time/presentation/screens/home_screen.dart';

class AppRouter {
  static void push<T extends AppRoute>(BuildContext context, T routeInfo) =>
      context.push(routeInfo.routingName, extra: routeInfo);

  static void pushReplacement<T extends AppRoute>(BuildContext context, T routeInfo) =>
      context.pushReplacement(routeInfo.routingName, extra: routeInfo);

  static void pop<T>(BuildContext context, T result) async => context.pop(result);

  static GoRouter baseRouter() => GoRouter(routes: [
    GoRoute(
      path: AppRouteName.home.name,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: AppRouteName.create.name,
      builder: (context, state) {
        final route = state.extra as CreateParkingLotRoute;
        Logger().d(route.routingName);
        return const CreateOrUpdateParkingLotScreen();
      },
    ),
    GoRoute(
      path: AppRouteName.update.name,
      builder: (context, state) {
        final route = state.extra as UpdateParkingLotRoute;
        Logger().d(route.entity.name);
        return const CreateOrUpdateParkingLotScreen();
      },
    ),
  ]);
}