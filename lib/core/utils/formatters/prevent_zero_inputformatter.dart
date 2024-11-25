import 'package:flutter/services.dart';

class CustomZeroPreventingTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Prevent input of "0" as the only digit
    if (newValue.text == '0') {
      return oldValue;
    }
    // Allow valid numeric input
    return newValue;
  }
}
