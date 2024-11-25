import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../get_it_injection.dart';
import '../utils/navigation_routes/navigation_utils.dart';
import '../utils/style/color_manager.dart';

Future<dynamic> showBottomDialog({required Widget child}) async {
  showDialog(
    barrierColor: ColorManager.basicsBlack.withOpacity(.7),
    context: getIt<NavUtils>().navigatorKey.currentState!.context,
    builder: (ctx) {
      return Material(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _BottomDialogBody(
              child: child,
            ),
          ],
        ),
      );
    },
  );
}

class _BottomDialogBody extends StatelessWidget {
  final Widget child;

  const _BottomDialogBody({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 34, horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: ColorManager.basicsWhite,
        borderRadius: BorderRadius.circular(24),
      ),
      width: 1.sw,
      child: child,
    );
  }
}
