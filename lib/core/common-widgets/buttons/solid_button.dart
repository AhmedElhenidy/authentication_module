// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/extensions/screen_util_extensions.dart';
import '../../utils/style/styles_manager.dart';
import '../../utils/style/text_manager.dart';
import '../loaders/animated_loading_widget.dart';

class SolidButton extends StatelessWidget {
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final ButtonStyle? buttonStyle;
  final String text;
  final Function()? onPressed;
  final bool loading;
  final Widget? child;

  const SolidButton({
    super.key,
    this.width,
    this.height,
    this.textStyle,
    this.buttonStyle,
    required this.text,
    this.onPressed,
    this.loading = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 1.sw,
      height: height ?? (ScreenUtil().isBiggerThanMobileScreen ? 40.h : 56.h),
      child: loading
          ? const Padding(
              padding: EdgeInsets.all(6.0),
              child: LoadingAnimation(),
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: onPressed == null
                  ? ButtonsStyleManager.solidButtonDisableStyle
                  : buttonStyle ?? ButtonsStyleManager.solidButtonStyle,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: child ??
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: textStyle ?? TextStyleManager.bold16Bold,
                      ),
                ),
              ),
            ),
    );
  }
}
