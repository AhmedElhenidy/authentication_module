import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/style/asset_manager.dart';
import '../utils/style/color_manager.dart';
import '../utils/style/text_manager.dart';
import 'images/image_widget.dart';

class ListTileWidget extends StatelessWidget {
  final String? leadingImagePath;
  final double? leadingImageWidth;
  final double? leadingImageHeight;
  final double? borderRadius;
  final String? title;
  final String? subTitle;
  final Color? tileColor;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final GestureTapCallback? onTap;
  final Widget? trailing;
  final double? horizontalTitleGap;
  const ListTileWidget({
    this.leadingImagePath,
    this.leadingImageWidth,
    this.leadingImageHeight,
    this.title,
    this.subTitle,
    this.borderRadius,
    this.tileColor,
    this.subTitleStyle,
    this.titleStyle,
    this.onTap,
    this.trailing,
    this.horizontalTitleGap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingImagePath == null
          ? null
          : ImageWidget(
              imageUrl: leadingImagePath!,
              width: leadingImageWidth ?? 20,
              height: leadingImageHeight ?? 20,
            ),
      title: Text(
        title ?? '',
        style: titleStyle ?? TextStyleManager.medium12Medium,
      ),
      subtitle: subTitle == null
          ? null
          : Text(
              subTitle ?? '',
              style: subTitleStyle ??
                  TextStyleManager.medium12Medium.copyWith(
                    color: ColorManager.greyGrey6,
                  ),
            ),
      trailing: trailing ??
          Transform.rotate(
            angle: context.locale.languageCode == 'ar' ? 3.14 : 0,
            child: ImageWidget(
              imageUrl: IconsAssets.arrow,
              height: 14.h,
              width: 14.h,
            ),
          ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      tileColor: tileColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      horizontalTitleGap: horizontalTitleGap ?? 8,
      onTap: onTap,
    );
  }
}
