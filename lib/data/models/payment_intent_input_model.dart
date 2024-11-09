class PaymentIntentInputModel {
  int amount;
  String currency;
  String customerId;

  PaymentIntentInputModel(
      {required this.amount, required this.currency, required this.customerId});

  Map<String, String> toJson() {
    return {
      'amount': "${amount * 100}",
      'currency': currency,
      'customer': customerId,
    };
  }
}
