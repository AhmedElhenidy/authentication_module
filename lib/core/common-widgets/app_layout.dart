import 'package:flutter/material.dart';

import '../utils/constants/numbers_constant.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  const AppLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth > AppNumbersConstant.appMaxWidth
            ? AppNumbersConstant.appMaxWidth
            : constraints.maxWidth;

        return Material(
          color: Colors.white,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppNumbersConstant.appMaxWidth,
              ),
              child: SizedBox(
                width: width,
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
