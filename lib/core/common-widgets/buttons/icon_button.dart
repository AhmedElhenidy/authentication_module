import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/style/color_manager.dart';
import '../../utils/style/text_manager.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomIconButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 153.5.w,
      height: 40.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          // padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h), backgroundColor: ColorManager.basicsWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.r),
            ),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: ColorManager.primaryPrimary6,
            ),
            SizedBox(width: 8.w),
            Text(
              text,
              style: TextStyleManager.bold12Bold.copyWith(
                color: ColorManager.primaryPrimary6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
