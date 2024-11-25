import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import '../../common-widgets/toast_widget.dart';
import '../../enums/toast_type.dart';
import '../style/color_manager.dart';
import '../style/text_manager.dart';

class OverlayUtils {
  static Future<OverlaySupportEntry> showToast(
    String? message, [
    ToastType toastType = ToastType.success,
  ]) async {
    return showSimpleNotification(
      ToastWidget(
        message: message ?? 'An Error Happened!'.tr(),
        type: toastType,
      ),
      contentPadding: const EdgeInsets.all(8),
      elevation: 0,
      duration: const Duration(milliseconds: 2500),
      background: Colors.transparent,
    );
  }

  static Future<OverlaySupportEntry> showMessage(
    String message, [
    bool success = false,
  ]) async {
    return showSimpleNotification(
      Text(
        message,
        style: TextStyleManager.bold10Bold.copyWith(color: Colors.white),
      ),
      contentPadding: const EdgeInsets.all(8),
      elevation: 3,
      background: success
          ? ColorManager.primaryPrimary1.withOpacity(.8)
          : Colors.red.withOpacity(.8),
    );
  }

  static OverlaySupportEntry overlayToUpdateApp(Widget child) {
    return showOverlay(
      (context, t) {
        return Opacity(
          opacity: t,
          child: Container(
            alignment: Alignment.bottomCenter,
            color: Colors.grey.withOpacity(.7),
            child: child,
          ),
        );
      },
      duration: Duration.zero,
    );
  }

}
