import 'package:flutter/material.dart';

import '../utils/style/color_manager.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final bool isDisabled;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.isDisabled,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18, // Custom width
      height: 18, // Custom height
      child: Transform.scale(
        scale: 1.2, // Scale factor for the checkbox
        child: Checkbox(
          value: widget.value,
          activeColor: ColorManager.secondarySecondary6,
          checkColor: ColorManager.basicsWhite,
          onChanged: widget.isDisabled ? null : widget.onChanged,
          side: const BorderSide(
            color: ColorManager.greyGrey4,
            width: 1,
          ),
        ),
      ),
    );
  }
}
