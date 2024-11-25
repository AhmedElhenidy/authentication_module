import 'package:flutter/material.dart';

import '../utils/style/color_manager.dart';

class HorizontalDividerWidget extends StatelessWidget {
  final Color? color;
  final double? horizontalMargin;
  const HorizontalDividerWidget({this.color,this.horizontalMargin,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalMargin??16.0),
      child: Divider(
        color: color??ColorManager.greyGrey2,
        height: 0,
      ),
    );
  }
}