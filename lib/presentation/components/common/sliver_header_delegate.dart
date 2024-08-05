import 'package:flutter/cupertino.dart';

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {

  const SliverHeaderDelegate({
    required Widget Function(BuildContext context, double shrinkOffset, bool overlapsContent) build,
    required double maxExtent,
    required double minExtent,
  }) : _buildArg = build,
       _maxExtentArg = maxExtent,
       _minExtentArg = minExtent;

  final Widget Function(BuildContext context, double shrinkOffset, bool overlapsContent) _buildArg;

  final double _maxExtentArg;

  final double _minExtentArg;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => _buildArg(context, shrinkOffset, overlapsContent);

  @override
  double get maxExtent => _maxExtentArg;

  @override
  double get minExtent => _minExtentArg;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;


}