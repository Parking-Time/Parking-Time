import 'package:flutter/material.dart';

import '../../app_route_name.dart';
import '../app_base_tab_route.dart';

class FavoriteRoute extends AppBaseTabRoute {
  FavoriteRoute({required super.navigatorKey}) : super(
    routeName: AppRouteName.favorite,
  );

  @override
  Widget builder2(BuildContext context) => Container();

}