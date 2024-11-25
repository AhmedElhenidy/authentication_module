import 'package:flutter/material.dart';
import 'text_manager.dart';

import 'color_manager.dart';

ThemeData getTameeniTheme() {
  return ThemeData(
    /// main colors of the app
    primaryColor: ColorManager.primaryPrimary1,
    dividerColor: ColorManager.greyGrey2,
    scaffoldBackgroundColor: ColorManager.basicsWhite,
    disabledColor: ColorManager.greyGrey2,
    fontFamily: FontManager.fontFamily,
    colorScheme: const ColorScheme.light(
      primary: ColorManager.primaryPrimary6,
      onPrimary: Colors.black,
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    appBarTheme: const AppBarTheme(foregroundColor: ColorManager.basicsBlack),
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.primaryPrimary6,
      hoverColor: ColorManager.primaryPrimary6.withOpacity(.5),
    ),
    textTheme: Typography().black.apply(
          fontFamily: FontManager.fontFamily,
        ),
    listTileTheme: const ListTileThemeData(
      horizontalTitleGap: 2,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    ),
  );
}
