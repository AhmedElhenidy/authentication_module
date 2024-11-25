import 'dart:ui';

class AppLocaleInfo {
  // Singleton instance
  static final AppLocaleInfo _instance = AppLocaleInfo._internal();

  // Variable to store the current app locale
  Locale? _currentLocale;

  // Private constructor
  AppLocaleInfo._internal();

  // Getter for the singleton instance
  static AppLocaleInfo get instance => _instance;

  // Set the current locale
  void setLocale(Locale locale) {
    _currentLocale = locale;
  }

  // Get the current locale
  Locale? getLocale() {
    return _currentLocale;
  }

  // Get the current language code (e.g., 'en' or 'ar')
  String? getCurrentLanguageCode() {
    return _currentLocale?.languageCode;
  }
}
