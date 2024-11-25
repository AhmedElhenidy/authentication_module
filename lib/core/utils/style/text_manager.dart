import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class FontManager {
  static const String fontFamily = 'Cairo';
}

abstract class LanguageManager {
  static String arabic = 'ar';
  static String english = 'en';
  static String assetsPathLocalisations = 'assets/translations';
  static Locale arabicLocal = const Locale('ar');
  static Locale englishLocal = const Locale('en');
}

abstract class TextStyleManager {
  /// regular10Reg figma properties

  /// fontSize: 10px
  /// height: 150%
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static TextStyle regular10Reg = TextStyle(
    fontSize: 10.sp,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  /// regular12Reg figma properties

  /// fontSize: 12px
  /// height: 150%
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static TextStyle regular12Reg = TextStyle(
    fontSize: 12.sp,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  /// regular14Reg figma properties

  /// fontSize: 14px
  /// height: 150%
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static TextStyle regular14Reg = TextStyle(
    fontSize: 14.sp,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  /// regular16Reg figma properties

  /// fontSize: 16px
  /// height: 150%
  /// fontWeight: 400
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static TextStyle regular16Reg = TextStyle(
    fontSize: 16.sp,
    height: 1.5,
    fontWeight: FontWeight.w400,
  );

  /// medium10Medium figma properties

  /// fontSize: 10px
  /// height: 150%
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static TextStyle medium10Medium = TextStyle(
    fontSize: 10.sp,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );

  /// medium12Medium figma properties

  /// fontSize: 12px
  /// height: 150%
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static TextStyle medium12Medium = TextStyle(
    fontSize: 12.sp,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );

  /// medium14Medium figma properties

  /// fontSize: 14px
  /// height: 150%
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static TextStyle medium14Medium = TextStyle(
    fontSize: 14.sp,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );

  /// medium16Medium figma properties

  /// fontSize: 16px
  /// height: 150%
  /// fontWeight: 500
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static TextStyle medium16Medium = TextStyle(
    fontSize: 16.sp,
    height: 1.5,
    fontWeight: FontWeight.w500,
  );

  /// bold10Bold figma properties

  /// fontSize: 10px
  /// height: 150%
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static TextStyle bold10Bold = TextStyle(
    fontSize: 10.sp,
    height: 1.5,
    fontWeight: FontWeight.w700,
  );

  /// bold12Bold figma properties

  /// fontSize: 12px
  /// height: 150%
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static TextStyle bold12Bold = TextStyle(
    fontSize: 12.sp,
    height: 1.5,
    fontWeight: FontWeight.w700,
  );

  /// bold14Bold figma properties

  /// fontSize: 14px
  /// height: 150%
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static TextStyle bold14Bold = TextStyle(
    fontSize: 14.sp,
    height: 1.5,
    fontWeight: FontWeight.w700,
  );

  /// bold16Bold figma properties

  /// fontSize: 16px
  /// height: 150%
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static TextStyle bold16Bold = TextStyle(
    fontSize: 16.sp,
    height: 1.5,
    fontWeight: FontWeight.w700,
  );

  /// fontSize: 18px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static TextStyle bold18Bold = TextStyle(
    fontSize: 18.sp,
    height: 1.5,
    fontWeight: FontWeight.w700,
  );

  /// fontSize: 20px
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static TextStyle bold20Bold = TextStyle(
    fontSize: 20.sp,
    height: 1.5,
    fontWeight: FontWeight.w700,
  );

  /// bold24Bold figma properties

  /// fontSize: 24px
  /// height: 150%
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static TextStyle bold24Bold = TextStyle(
    fontSize: 24.sp,
    height: 1.5,
    fontWeight: FontWeight.w700,
  );

  /// extraBoldExtraBold10 figma properties

  /// fontSize: 10px
  /// height: 150%
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static TextStyle extraBoldExtraBold10 = TextStyle(
    fontSize: 10.sp,
    height: 1.5,
    fontWeight: FontWeight.w700,
  );

  /// extraBoldExtraBold24 figma properties

  /// fontSize: 24px
  /// height: 150%
  /// fontWeight: 700
  /// letterSpacing: none
  /// fontStyle: none
  /// decoration: none
  static TextStyle extraBoldExtraBold24 = TextStyle(
    fontSize: 24.sp,
    height: 1.5,
    fontWeight: FontWeight.w700,
  );

  static TextStyle carPlate = TextStyle(
    fontSize: 9.sp,
    fontWeight: FontWeight.w700,
  );
}
