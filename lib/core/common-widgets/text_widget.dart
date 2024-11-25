import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/style/color_manager.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final String? fontFamily;
  final Color? titleColor;
  final TextAlign? titleAlign;
  final double? size;
  final TextDecoration? textDecoration;
  final int? titleMaxLines;
  final bool underLine;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final double? height;
  final TextStyle? style;

  const TextWidget({
    super.key,
    required this.title,
    this.titleColor,
    this.titleAlign,
    this.underLine = false,
    this.size,
    this.titleMaxLines,
    this.fontWeight,
    this.overflow,
    this.textDecoration,
    this.fontFamily,
    this.height,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style ??
          TextStyle(
            decorationColor: titleColor ?? ColorManager.basicsBlack,
            decoration: textDecoration ?? TextDecoration.none,
            color: titleColor ?? ColorManager.basicsBlack,
            fontFamily: fontFamily,
            fontSize: size ?? 14.sp,
            fontWeight: fontWeight ?? FontWeight.normal,
            height: height,
          ),
      maxLines: titleMaxLines ?? 2,
      textAlign: titleAlign ?? TextAlign.center,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }
}
