import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/services.dart' as services;
import '../utils/extensions/screen_util_extensions.dart';
import '../utils/formatters/formatter.dart';
import '../utils/formatters/turn_to_english_numbers_inputformatter.dart';
import '../utils/style/color_manager.dart';
import '../utils/style/text_manager.dart';

class OTPInputField extends StatelessWidget {
  final Function(String) onOtpChanged;
  final TextEditingController controller;

  OTPInputField({
    super.key,
    required this.onOtpChanged,
    required this.controller,
  });

  final defaultPinTheme = PinTheme(
    width: 79.75.w,
    height: ScreenUtil().isBiggerThanMobileScreen ? 40.h : 56.h,
    textStyle: TextStyleManager.bold16Bold,
    decoration: BoxDecoration(
      border: Border.all(
        color: ColorManager.greyGrey3,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: services.TextDirection.ltr,
      child: Center(
        child: Pinput(
          controller: controller,
          length: 4,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorManager.primaryPrimary6,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          autofocus: true,
          keyboardType: TextInputType.number,
          inputFormatters: [
            ArabicToEnglishNumberFormatter(),
            AppFormatter.digitsOnly,
          ],
          onChanged: onOtpChanged,
        ),
      ),
    );
  }
}
