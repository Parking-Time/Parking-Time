import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:parking_time/config/theme/theme.dart';

import '../../components/flux_image.dart';

class LogoSliverDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => Opacity(
    opacity: max(1 - shrinkOffset / (maxExtent-10), 0),
    child: Container(
      height: maxExtent - shrinkOffset,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 24, right: 24, top: 10),
      child: Row(
        children: [
          const FluxImage(imageUrl: 'assets/images/logo/blue_simbol_logo_en_horizontal.svg', color: kWhite, width: 110, fit: BoxFit.fitWidth),
          const Expanded(child: SizedBox()),
          AppIcons.notification(color: kWhite),
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