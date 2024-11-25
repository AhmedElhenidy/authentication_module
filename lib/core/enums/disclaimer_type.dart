// ignore_for_file: constant_identifier_names


enum DisclaimerType {
  IBAN(1),
  Tamara(2),
  Tabby(3),
  MerchantPageEnable(4),
  TPLNotSandPlus(5),
  SumInsuredChanged(6),
  ConfirmInfo(7),
  ActivatePolicyAfter24Hours(8),
  Tameeni(9),
  Company(10),
  BurujCompany(11),
  WataniyaCompany(12),
  MBIAddon(13);
  // RenewDummy(14),
  // RecurringPayment(15),
  // VAS(16);

  final int value;
  const DisclaimerType(this.value);
}