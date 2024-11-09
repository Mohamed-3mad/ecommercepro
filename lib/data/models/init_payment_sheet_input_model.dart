class InitPaymentSheetInputModel {
  final String clientSecret, ephemeralKeySecret, customerId;

  InitPaymentSheetInputModel(
      {required this.customerId,
      required this.clientSecret,
      required this.ephemeralKeySecret});
}
