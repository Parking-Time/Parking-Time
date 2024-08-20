import 'package:flutter/material.dart';

import '../../../../presentation/ui/home/home_screen.dart';
import '../../app_route_name.dart';
import '../app_base_tab_route.dart';

class HomeRoute extends AppBaseTabRoute {
  HomeRoute({required super.navigatorKey}) : super(
    routeName: AppRouteName.home,
  );

  @override
  Widget builder2(BuildContext context) => const HomeScreen();

}