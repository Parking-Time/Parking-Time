import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class AppIcons {
  static Widget search({Color? color, double? size}) =>
      SvgPicture.asset('assets/icons/search.svg', color: color, height: size, width: size, fit: BoxFit.fitWidth);
}