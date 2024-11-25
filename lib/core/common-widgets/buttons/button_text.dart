import 'package:flutter/material.dart';

import '../../utils/style/color_manager.dart';
import '../../utils/style/text_manager.dart';

class ButtonText extends StatelessWidget {
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final String text;
  final Function()? onPressed;
  final Color? backgroundColor;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  const ButtonText({
    super.key,
    this.width,
    this.height,
    this.textStyle,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.radius = 0,
    this.padding,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: child??Text(
          text,
          style: textStyle??TextStyleManager.bold14Bold
              .copyWith(color: ColorManager.primaryPrimary6),
        ),
      ),
    );
  }
}
