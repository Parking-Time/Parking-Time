import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../resources/styles/colors.dart';
import '../../../presentation/resources/assets.gen.dart';

class FluxImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final String? package;
  final bool? repeat;
  final bool fromFile;
  final BlendMode? blendMode;

  const FluxImage({
    required this.imageUrl,
    super.key,
    this.width,
    this.height,
    this.fit,
    this.color,
    this.package,
    this.repeat,
    this.fromFile = false,
    this.blendMode,
  });

  @override
  Widget build(BuildContext context) {
    var imageProxy = '';
    var isSvgImage = imageUrl.split('.').last == 'svg';
    var isLottieImage = imageUrl.split('.').last == 'json';

    if (fromFile) {
      return Image.file(
        File(imageUrl),
        fit: BoxFit.cover,
        width: 140,
        height: 140,
        colorBlendMode: blendMode,
      );
    }

    if (imageUrl.isEmpty) {
      return Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: kGray3,
        child: Assets.images.logo.blueSimbolLogoEnVertical.svg(),
      );
    }

    if (isSvgImage) {
      return SvgPicture.network(
        '$imageProxy$imageUrl',
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      );
    }

    if (isLottieImage) {
      return Lottie.network(
        imageUrl,
        repeat: true,
        reverse: true,
        animate: true,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );
    }
    return SizedBox(
      width: width,
      height: height,
      child: ExtendedImage.network(
        '$imageProxy$imageUrl',
        fit: fit,
        color: color,
        cache: true,
        colorBlendMode: blendMode,

        loadStateChanged: (state) {
          switch (state.extendedImageLoadState) {
            case LoadState.completed:
              return state.completedWidget;
            case LoadState.loading:
              return Container(
                height: height,
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: kGray3,
                child: Assets.images.logo.blueSimbolLogoEnVertical.svg(),
              );
            case LoadState.failed:
              return Container(
                height: height,
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: kGray3,
                child: Assets.images.logo.blueSimbolLogoEnVertical.svg(),
              );
            default:
              return SizedBox(
                height: height,
                width: width,
              );
          }
        },
      ),
    );
  }
}
