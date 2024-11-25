import 'package:flutter/material.dart';

import '../utils/style/color_manager.dart';
import '../utils/style/text_manager.dart';

class ChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  const ChipWidget({
    required this.label,
    required this.isSelected,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? ColorManager.secondarySecondary6
              : ColorManager.basicsWhite,
          border: Border.all(color: ColorManager.greyGrey3),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Text(
          label,
          style: TextStyleManager.medium10Medium.copyWith(
            color: isSelected
                ? ColorManager.basicsWhite
                : ColorManager.basicsBlack,
          ),
        ),
      ),
    );
  }
}
