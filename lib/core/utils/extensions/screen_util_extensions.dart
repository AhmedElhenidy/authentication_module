import 'package:flutter_screenutil/flutter_screenutil.dart';

extension CustomScreenUtilExtension on ScreenUtil {
  // Custom method to adjust font size based on aspect ratio
  bool get isBiggerThanMobileScreen => screenHeight > 1000;
}
