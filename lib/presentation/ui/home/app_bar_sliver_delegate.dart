import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../../resources/styles/colors.dart';
import '../../../presentation/resources/assets.gen.dart';
import '../../../presentation/router/app_router.dart';
import '../../../presentation/router/routes/screen_routes/admin_route.dart';

class AppBarSliverDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => Opacity(
    opacity: max(1 - shrinkOffset / (maxExtent-10), 0),
    child: Container(
      height: maxExtent - shrinkOffset,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 24, right: 24, top: 10),
      child: Row(
        children: [
          GestureDetector(
            onDoubleTap: () => AppRouter.getRoute<AdminRoute>().push(AdminRouteArgs()),
            child: Assets.images.logo.blueSimbolLogoEnHorizontal.svg(colorFilter: const ColorFilter.mode(kWhite, BlendMode.srcIn), width: 110, fit: BoxFit.fitWidth),
          ),
          const Spacer(),
          //AppIcons.notification(color: kWhite),
        ],
      ),
    ),
  );

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

}