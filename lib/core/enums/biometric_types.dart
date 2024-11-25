import 'package:easy_localization/easy_localization.dart';

enum BiometricTypes { notAvailable, passCode, fingerPrint, faceId }

extension BiometricTypesExtension on BiometricTypes {
  String get displayName {
    switch (this) {
      case BiometricTypes.notAvailable:
        return 'Not Available'.tr();
      case BiometricTypes.passCode:
        return 'Pass Code'.tr();
      case BiometricTypes.fingerPrint:
        return 'Finger Print'.tr();
      case BiometricTypes.faceId:
        return 'Face ID'.tr();
      default:
        return '';
    }
  }

  int get getBioTypeNumber {
    switch (this) {
      case BiometricTypes.notAvailable:
        return 6;
      case BiometricTypes.passCode:
        return 4;
      case BiometricTypes.fingerPrint:
        return 1;
      case BiometricTypes.faceId:
        return 2;
      default:
        return 6;
    }
  }
}
