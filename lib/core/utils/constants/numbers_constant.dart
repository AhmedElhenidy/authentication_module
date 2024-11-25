class AppNumbersConstant {
  static const int sequenceNumberLimitMaxLength = 9;
  static const int sequenceNumberLimitMinValue = 10;
  static const int vehicleEstimatedMinValue = 10000;
  static const int vehicleEstimatedMaxValue = 3000000;
  static const int trailEstimatedMaxValue = 100000;
  static const int customIdMinValue = 100000;
  static const int customIdMaxValue = 9999999999;
  static const int customIdNumberLimitMiXValue = 10;
  static const int baseAvailabilitySuccessInterval = 10; // Seconds

  // Quotations
  static const int minSecToCallAvailability = 36000; // 10 Hours
  static const int maxSecToCallAvailability =
      35920; // 9 Hours 58 Minutes 40 Seconds

  //Disclaimers
  static const int tamaraPaymentMethodByFour = 5;
  static const int tamaraPaymentMethodBySix = 6;

  static const int tamaraDisclaimerIndex = 2;
  static const double appMaxWidth = 700;

  static const arabicToEnglish = {
    '٠': '0',
    '١': '1',
    '٢': '2',
    '٣': '3',
    '٤': '4',
    '٥': '5',
    '٦': '6',
    '٧': '7',
    '٨': '8',
    '٩': '9',
  };
}

class AppRegEx {
  static RegExp arabicNumbers = RegExp(r'[٠١٢٣٤٥٦٧٨٩]');
}

class HealthConditionIds {
  static const int automaticVehicle = 1;
  static const int prosthesesPart = 2;
  static const int lensesforEyesight = 3;
  static const int daytimeOnly = 4;
  static const int earpiece = 5;
  static const int vehiclefordisabled = 6;
}

class TrafficViolationIds {
  static const int speedTicket = 1;
  static const int overrideTrafficLight = 2;
  static const int drivingOppositeDirection = 3;
  static const int drifting = 4;
  static const int parkingViolation = 5;
  static const int businessEmail = 0;
  static const int nationalID = 1;
  static const int promoCode = 2;
}

class SchemeConstant {
  static const int businessEmail = 1;
  static const int nationalID = 2;
  static const int promoCode = 3;
}

class InsuranceType {
  static const int tpl = 1;
  static const int comp = 2;
  static const int both = 3;
}

class RepairMethods {
  static const int agency = 1;
  static const int workshop = 2;
  static const int both = 3;

  static String getRepairMethodNameById(int id) {
    switch (id) {
      case RepairMethods.agency:
        return 'Agency';
      case RepairMethods.workshop:
        return 'Workshop';
      case RepairMethods.both:
        return 'Agency and Workshop';
      default:
        return 'Unknown';
    }
  }
}

class PaymentMethodIDs {
  static const int none = 0;
  static const int mada = 7;
  static const int masterCard = 8;
  static const int visa = 9;
  static const int sadad = 28;
  static const int tamaraSplitBy4 = 29;
  static const int applePay = 33;
  static const int applePayPreparation = 34;
  static const int tamaraSplitBy6 = 35;
}

class PaymentMethodIndex {
  static const int visa = 0;
  static const int mada = 1;
  static const int masterCard = 2;
  static const int sadad = 3;
  static const int applePay = 4;
  static const int tamaraSplitBy4 = 5;
  static const int tamaraSplitBy6 = 6;
}

class PaymentInquiry {
  static const int issuePolicyFailed = 0;
  static const int issuePolicySuccess = 1;
  static const int alreadyPurchased = 2;
  static const int quoteExpired = 3;
  static const int transferDataFailed = 4;
  static const int partnerFetchPolicyFailed = 5;
  static const int generatePdfFailed = 6;
  static const int transferAndGenerate = 7;
  static const int purchasePolicyLimitExceed = 8;
  static const int anotherPolicyPurchased = 9;
  static const int issueInProgress = 10;
  static const int wrongAmounts = 11;
  static const int paymentFailed = 12;
}

class DownloadFileTypes {
  static const int policyPaper = 1;
  static const int insuranceCard = 2;
  static const int receipt = 5;
  static const int termsAndCondition = 4;
}

class PaymentMethodState {
  static const int enabled = 1;
  static const int couponApplied = 2;
  static const int notInRange = 3;
  static const int qitafApplied = 4;
  static const int addonSelected = 5;
  static const int livePhoto = 6;
  static const int disabled = 7;
}

class InspectionType {
  static const int liveInspection = 3;
}
