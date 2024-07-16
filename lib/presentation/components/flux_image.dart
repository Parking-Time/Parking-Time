import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../common/asset_path/asset_path.dart';
import '../../config/theme/theme.dart';

class FluxImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final String? package;
  final bool? repeat;
  final bool? fromFile;
  final BlendMode? blendMode;

  const FluxImage(
      {required this.imageUrl, super.key, this.width, this.height, this.fit, this.color, this.package, this.repeat, this.fromFile, this.blendMode});

  @override
  Widget build(BuildContext context) {
    var imageProxy = '';
    var isSvgImage = imageUrl.split('.').last == 'svg';
    var isLottieImage = imageUrl.split('.').last == 'json';

    if (fromFile != null && fromFile!) {
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
        child: const FluxImage(imageUrl: blueSimbolLogoEnVertical),
      );
    }

    if (!imageUrl.contains('http')) {
      if (isSvgImage) {
        return SvgPicture.asset(
          imageUrl,
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain,
          color: color,
          package: package,
        );
      }

      if (isLottieImage) {
        return Lottie.asset(
          imageUrl,
          repeat: repeat,
          reverse: false,
          animate: true,
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain,
        );
      }

      if (imageUrl.contains('app_tracks')) {
        return Image.file(File(imageUrl),
            height: height,
            width: width,
            fit: fit,
            colorBlendMode: blendMode,
            errorBuilder: (_, __, ___) => Container(
              color: kGray3,
              height: height,
              width: width,
            ));
      }

      return Image.asset(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        color: color,
        package: package,
        colorBlendMode: blendMode,
      );
    }

    if (isSvgImage) {
      return SvgPicture.network(
        '$imageProxy$imageUrl',
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        color: color,
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
                child: const FluxImage(imageUrl: blueSimbolLogoEnVertical),
              );
            case LoadState.failed:
              return Container(
                height: height,
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: kGray3,
                child: const FluxImage(imageUrl: blueSimbolLogoEnVertical),
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
