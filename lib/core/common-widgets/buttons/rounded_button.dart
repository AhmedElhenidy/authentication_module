// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/extensions/screen_util_extensions.dart';
import '../../utils/style/styles_manager.dart';
import '../../utils/style/text_manager.dart';

class RoundedButton extends StatelessWidget {
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final ButtonStyle? buttonStyle;
  final String text;
  final Function()? onPressed;
  final bool loading;

  const RoundedButton({
    super.key,
    this.width,
    this.height,
    this.textStyle,
    this.buttonStyle,
    required this.text,
    this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? .9.sw,
      height: height ?? (ScreenUtil().isBiggerThanMobileScreen ? 40.h : 56.h),
      child: loading
          ? const Center(child: CircularProgressIndicator())
          : ElevatedButton(
              onPressed: onPressed,
              style: buttonStyle ?? ButtonsStyleManager.roundedButtonStyle,
              child: Text(
                maxLines: 1,
                text,
                style: textStyle ?? TextStyleManager.bold16Bold,
              ),
            ),
    );
  }
}
