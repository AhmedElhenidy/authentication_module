import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/style/color_manager.dart';
import '../utils/style/styles_manager.dart';
import '../utils/style/text_manager.dart';
import 'buttons/solid_button.dart';
import 'images/image_widget.dart';

class ConfirmationDialogue extends StatelessWidget {
  final String iconPath;
  final String title;
  final String? subtitle;
  final String confirmButtonText;
  final String? cancelButtonText;
  final void Function() onConfirm;
  final void Function()? onCancel;
  const ConfirmationDialogue({
    required this.iconPath,
    required this.title,
    required this.confirmButtonText,
    required this.onConfirm,
    this.subtitle,
    this.cancelButtonText,
    this.onCancel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: ColorManager.greyGrey1,
          radius: 28.w,
          child: ImageWidget(
            imageUrl: iconPath,
            width: 32.w,
            height: 23.w,
          ),
        ),
        16.verticalSpace,
        Text(
          title.tr(),
          textAlign: TextAlign.center,
          style: TextStyleManager.bold16Bold,
        ),
        if (subtitle != null) ...[
          8.verticalSpace,
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyleManager.medium14Medium,
          ),
        ],
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Expanded(
              child: SolidButton(
                onPressed: onCancel ??
                    () {
                      Navigator.pop(context);
                    },
                height: 48.h,
                buttonStyle: ButtonsStyleManager.solidButtonInvertedStyle,
                text: cancelButtonText ?? 'No, cancel'.tr(),
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: SolidButton(
                onPressed: onConfirm,
                height: 48.h,
                text: confirmButtonText,
                buttonStyle: ButtonsStyleManager.solidButtonStyle.copyWith(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    ColorManager.errorError6,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
