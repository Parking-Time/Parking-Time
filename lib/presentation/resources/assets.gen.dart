/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/bx-search.svg
  SvgGenImage get bxSearch => const SvgGenImage('assets/icons/bx-search.svg');

  /// File path: assets/icons/bxs-back.svg
  SvgGenImage get bxsBack => const SvgGenImage('assets/icons/bxs-back.svg');

  /// File path: assets/icons/bxs-bell.svg
  SvgGenImage get bxsBell => const SvgGenImage('assets/icons/bxs-bell.svg');

  /// File path: assets/icons/bxs-close-circle.svg
  SvgGenImage get bxsCloseCircle => const SvgGenImage('assets/icons/bxs-close-circle.svg');

  /// File path: assets/icons/bxs-dollar-circle.svg
  SvgGenImage get bxsDollarCircle => const SvgGenImage('assets/icons/bxs-dollar-circle.svg');

  /// File path: assets/icons/bxs-heart.svg
  SvgGenImage get bxsHeart => const SvgGenImage('assets/icons/bxs-heart.svg');

  /// File path: assets/icons/bxs-home.svg
  SvgGenImage get bxsHome => const SvgGenImage('assets/icons/bxs-home.svg');

  /// File path: assets/icons/bxs-map.svg
  SvgGenImage get bxsMap => const SvgGenImage('assets/icons/bxs-map.svg');

  /// File path: assets/icons/bxs-registered.svg
  SvgGenImage get bxsRegistered => const SvgGenImage('assets/icons/bxs-registered.svg');

  /// File path: assets/icons/bxs-right-arrow-circle.svg
  SvgGenImage get bxsRightArrowCircle => const SvgGenImage('assets/icons/bxs-right-arrow-circle.svg');

  /// File path: assets/icons/bxs-store-alt.svg
  SvgGenImage get bxsStoreAlt => const SvgGenImage('assets/icons/bxs-store-alt.svg');

  /// File path: assets/icons/bxs-time-five.svg
  SvgGenImage get bxsTimeFive => const SvgGenImage('assets/icons/bxs-time-five.svg');

  /// File path: assets/icons/bxs-user.svg
  SvgGenImage get bxsUser => const SvgGenImage('assets/icons/bxs-user.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        bxSearch,
        bxsBack,
        bxsBell,
        bxsCloseCircle,
        bxsDollarCircle,
        bxsHeart,
        bxsHome,
        bxsMap,
        bxsRegistered,
        bxsRightArrowCircle,
        bxsStoreAlt,
        bxsTimeFive,
        bxsUser
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/logo
  $AssetsImagesLogoGen get logo => const $AssetsImagesLogoGen();
}

class $AssetsImagesLogoGen {
  const $AssetsImagesLogoGen();

  /// File path: assets/images/logo/blue_logo_en.svg
  SvgGenImage get blueLogoEn => const SvgGenImage('assets/images/logo/blue_logo_en.svg');

  /// File path: assets/images/logo/blue_logo_kr.svg
  SvgGenImage get blueLogoKr => const SvgGenImage('assets/images/logo/blue_logo_kr.svg');

  /// File path: assets/images/logo/blue_simbol.svg
  SvgGenImage get blueSimbol => const SvgGenImage('assets/images/logo/blue_simbol.svg');

  /// File path: assets/images/logo/blue_simbol_logo_en_horizontal.svg
  SvgGenImage get blueSimbolLogoEnHorizontal =>
      const SvgGenImage('assets/images/logo/blue_simbol_logo_en_horizontal.svg');

  /// File path: assets/images/logo/blue_simbol_logo_en_vertical.svg
  SvgGenImage get blueSimbolLogoEnVertical => const SvgGenImage('assets/images/logo/blue_simbol_logo_en_vertical.svg');

  /// List of all assets
  List<SvgGenImage> get values =>
      [blueLogoEn, blueLogoKr, blueSimbol, blueSimbolLogoEnHorizontal, blueSimbolLogoEnVertical];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const String pubspec = 'pubspec.yaml';

  /// List of all assets
  static List<String> get values => [pubspec];
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final BytesLoader loader;
    if (_isVecFormat) {
      loader = AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ?? (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
