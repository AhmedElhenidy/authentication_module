import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../enums/toast_type.dart';
import '../utils/style/asset_manager.dart';
import '../utils/style/color_manager.dart';
import '../utils/style/text_manager.dart';
import 'images/image_widget.dart';

class ToastWidget extends StatelessWidget {
  final String message;
  final ToastType type;

  const ToastWidget({
    super.key,
    required this.message,
    this.type = ToastType.success,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .9.sw,
      // height: 50.h,
      decoration: BoxDecoration(
        color: type == ToastType.success
            ? ColorManager.successSuccess6
            : type == ToastType.warning
                ? ColorManager.warningWarning6
                : ColorManager.errorError6,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ImageWidget(
              imageUrl: type == ToastType.success
                  ? IconsAssets.done
                  : IconsAssets.warning,
              colorFilter: ColorFilter.mode(
                type == ToastType.success || type == ToastType.failure
                    ? ColorManager.basicsWhite
                    : ColorManager.basicsBlack,
                BlendMode.srcIn,
              ),
              height: 20.w,
              width: 20.w,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message,
                overflow: TextOverflow.ellipsis,
                maxLines: 7,
                style: TextStyleManager.medium14Medium.copyWith(
                  color: type == ToastType.success || type == ToastType.failure
                      ? ColorManager.basicsWhite
                      : ColorManager.basicsBlack,
                ),
              ),
            ),
          ),
          16.horizontalSpace,
        ],
      ),
    );
  }
}
