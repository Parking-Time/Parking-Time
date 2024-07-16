import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class AppIcons {

  static Widget _buildIcon(String prefix, {Color? color, double? size}) => SvgPicture.asset(
    prefix,
    color: color,
    //colorFilter: color != null ? ColorFilter.mode(color, BlendMode.color) : null,
    height: size ?? 24,
    width: size ?? 24,
    fit: BoxFit.fitWidth,
  );

  static Widget home({Color? color, double? size}) => _buildIcon('assets/icons/bxs-home.svg', color: color, size: size);

  static Widget favorite({Color? color, double? size}) => _buildIcon('assets/icons/bxs-heart.svg', color: color, size: size);

  static Widget user({Color? color, double? size}) => _buildIcon('assets/icons/bxs-user.svg', color: color, size: size);

  static Widget search({Color? color, double? size}) => _buildIcon('assets/icons/bx-search.svg', color: color, size: size);

  static Widget notification({Color? color, double? size}) => _buildIcon('assets/icons/bxs-bell.svg', color: color, size: size);

}