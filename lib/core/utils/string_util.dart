import 'package:flutter/material.dart';

class StringUtils {
  static String convertToArabicNumber(String number) {
    String res = '';

    final arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    for (var element in number.characters) {
      res += arabic[int.parse(element)];
    }

    return res;
  }
}
