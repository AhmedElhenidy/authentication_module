import 'package:flutter/material.dart';

import '../style/color_manager.dart';

class BottomSheetUtils {
  final GlobalKey<NavigatorState> navigatorKey;

  BottomSheetUtils({required this.navigatorKey});

  Future showBasicAppModal({
    double? height,
    bool isDismissible = true,
    Function(bool)? onPopInvoked,
    final Color? backgroundColor = ColorManager.basicsWhite,
    required Widget child,
    bool shouldPreventKeyboardOverlay = false,
  }) async {
    return showModalBottomSheet(
      backgroundColor: backgroundColor,
      context: navigatorKey.currentState!.context,
      isScrollControlled: true,
      enableDrag: isDismissible,
      isDismissible: isDismissible,
      showDragHandle: isDismissible,
      useSafeArea: true,
      builder: (context) => PopScope(
        // ignore: deprecated_member_use
        onPopInvoked: onPopInvoked,
        canPop: isDismissible,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: shouldPreventKeyboardOverlay
                ? MediaQuery.of(
                    navigatorKey.currentState!.context,
                  ).viewInsets.bottom
                : 0,
          ),
          child: SizedBox(
            height: height,
            child: child,
          ),
        ),
      ),
    );
  }
}
