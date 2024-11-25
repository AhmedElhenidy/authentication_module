import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

class AppFormatter {
  static final priceFormatter = NumberFormat.decimalPatternDigits(
    locale: 'en_us',
    decimalDigits: 2,
  );

  static final priceFormatterZeroO = NumberFormat.decimalPatternDigits(
    locale: 'en_us',
    decimalDigits: 0,
  );

  static String formatTimeIntoHoursAndMinutes(int timeInSeconds) {
    final minutes = (timeInSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (timeInSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  static final digitsOnly =
      FilteringTextInputFormatter.allow(RegExp(r'[0-9٠-٩]'));
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  final NumberFormat _numberFormat = AppFormatter.priceFormatterZeroO;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Remove any existing commas in the input
    String newText = newValue.text.replaceAll(',', '');

    // Convert to int to format the number correctly
    int? value = int.tryParse(newText);
    if (value == null) {
      return oldValue; // If the conversion fails, return the old value
    }

    // Format the number with commas
    String formattedText = _numberFormat.format(value);

    // Return the new formatted value
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
