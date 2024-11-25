import 'package:easy_localization/easy_localization.dart';

enum PoliciesStates { active, toRenew, expired }

extension PoliciesStatesExtension on PoliciesStates {
  String get displayName {
    switch (this) {
      case PoliciesStates.active:
        return 'Active'.tr();
      case PoliciesStates.toRenew:
        return 'To Renew'.tr();
      case PoliciesStates.expired:
        return 'Expired'.tr();
      default:
        return '';
    }
  }

  int get dashboardType {
    switch (this) {
      case PoliciesStates.toRenew:
        return 2;
      case PoliciesStates.expired:
        return 3;
      default:
        return 1;
    }
  }
}
