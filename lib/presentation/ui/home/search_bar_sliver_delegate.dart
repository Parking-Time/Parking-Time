import 'package:flutter/cupertino.dart';

class SearchBarSliverDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 70;

  @override
  // TODO: implement minExtent
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

}
