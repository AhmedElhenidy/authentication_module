import 'package:flutter/material.dart';

import 'color_manager.dart';

abstract class ButtonsStyleManager {
  static final solidButtonStyle = ButtonStyle(
    backgroundColor:
        WidgetStateProperty.all<Color>(ColorManager.primaryPrimary6),
    foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
    // Text color
    elevation: WidgetStateProperty.all<double>(0),
    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    ),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static final solidButtonDisableStyle = solidButtonStyle.copyWith(
    backgroundColor: WidgetStateProperty.all<Color>(ColorManager.greyGrey2),
  );

  static final solidButtonInvertedStyle = solidButtonStyle.copyWith(
    backgroundColor:
        WidgetStateProperty.all<Color>(ColorManager.primaryPrimary1),
    foregroundColor: WidgetStateProperty.all<Color>(
      ColorManager.primaryPrimary6,
    ), // Text color
  );

  static final roundedButtonStyle = ButtonStyle(
    backgroundColor:
        WidgetStateProperty.all<Color>(ColorManager.primaryPrimary6),
    foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
    // Text color
    elevation: WidgetStateProperty.all<double>(0),
    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    ),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
    ),
  );
}
