import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/style/asset_manager.dart';
import '../../utils/style/color_manager.dart';

class ImageWidget extends StatelessWidget {
  final Widget Function(BuildContext)? placeholderBuilder;
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final ColorFilter? colorFilter;
  final bool isCarImage;

  const ImageWidget({
    required this.imageUrl,
    super.key,
    this.width = 165,
    this.height = 52,
    this.fit,
    this.color,
    this.colorFilter,
    this.placeholderBuilder,
    this.isCarImage = false,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.startsWith('http')) {
      if (imageUrl.endsWith('svg')) {
        return SvgPicture.network(
          imageUrl,
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain,
          colorFilter: colorFilter,
          placeholderBuilder: placeholderBuilder,
        );
      } else {
        return ExtendedImage.network(
          imageUrl,
          width: width,
          height: height,
          fit: fit ?? BoxFit.fill,
          color: color,
          cache: true,
          loadStateChanged: (state) {
            switch (state.extendedImageLoadState) {
              case LoadState.completed:
                return state.completedWidget;
              case LoadState.loading:
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primaryPrimary1,
                  ),
                );
              case LoadState.failed:
              default:
                return ImageErrorFallWidget(
                  fit: fit,
                  width: width,
                  height: height,
                  isCarImage: isCarImage,
                );
            }
          },
        );
      }
    } else if (imageUrl.contains('.svg')) {
      return SvgPicture.asset(
        imageUrl,
        semanticsLabel: 'Acme Logo',
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        colorFilter: colorFilter,
      );
    }
    return Image.asset(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return ImageErrorFallWidget(
          fit: fit,
          width: width,
          height: height,
          isCarImage: isCarImage,
        );
      },
      color: color,
    );
  }
}

class ImageErrorFallWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool isCarImage;
  const ImageErrorFallWidget({
    super.key,
    this.width = 165,
    this.height = 52,
    this.fit,
    this.isCarImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return isCarImage
        ? Image.asset(
            IconsAssets.carInsuranceLogo,
            width: width,
            height: height,
            fit: fit ?? BoxFit.contain,
          )
        : SvgPicture.asset(
            IconsAssets.newTameeniLogo,
            width: width,
            height: height,
            fit: fit ?? BoxFit.contain,
            colorFilter: const ColorFilter.mode(
              ColorManager.greyGrey3,
              BlendMode.srcIn,
            ),
          );
  }
}
