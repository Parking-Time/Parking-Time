import 'package:flutter/material.dart';

import '../../app_route_name.dart';
import '../app_base_tab_route.dart';

class ProfileRoute extends AppBaseTabRoute {
  ProfileRoute({required super.navigatorKey}) : super(
    routeName: AppRouteName.profile,
  );

  @override
  Widget builder2(BuildContext context) => Container();

}