import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/style/color_manager.dart';

class StepperWidget extends StatefulWidget {
  final int length;
  final int selectedStep;

  const StepperWidget({required this.length, this.selectedStep = 0, super.key});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(
        widget.length,
        (index) => Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: index == 0 ? 0 : 5.w,
            ),
            child: LinearProgressIndicator(
              value: widget.selectedStep >= index ? 1 : 0,
              color: ColorManager.secondarySecondary6,
              backgroundColor: ColorManager.greyGrey3,
              borderRadius: BorderRadius.circular(
                24,
              ),
              minHeight: 4.h,
              // valueColor: AlwaysStoppedAnimation<Color>(ColorManager.secondarySecondary6),
            ),
          ),
        ),
      ),
    );
  }
}
