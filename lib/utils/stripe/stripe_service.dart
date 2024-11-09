import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fruitmarket/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:fruitmarket/data/models/init_payment_sheet_input_model.dart';
import 'package:fruitmarket/data/models/payment_intent_input_model.dart';
import 'package:fruitmarket/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:fruitmarket/utils/stripe/api_keys.dart';
import 'package:fruitmarket/utils/stripe/api_service.dart';
class StripeService {
  final ApiService apiService = ApiService();
  //1-paymentIntentObject create payment intent (required amount , required currency)
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymenIntentInputModel) async {
    var response = await apiService.post(
        body: paymenIntentInputModel.toJson(),
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/payment_intents',
        token: ApiKeys.secretKey);

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }
  //2-init payment sheet (paymentIntentClientSecret)

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName: 'Mohamed',
      ),
    );
  }

  //3- presentPaymentSheet  ->await Stripe.instance.presentPaymentSheet();
  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

// عشان اجمع ال 3 خطوات فيها
  Future makePayment(
      {required PaymentIntentInputModel paymenIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymenIntentInputModel);
    var ephemeralKeyModel =
        await createEphemeralKey(customerId: paymenIntentInputModel.customerId);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
        customerId: paymenIntentInputModel.customerId,
        clientSecret: paymentIntentModel.clientSecret!,
        ephemeralKeySecret: ephemeralKeyModel.secret!);
    await initPaymentSheet(
      initPaymentSheetInputModel: initPaymentSheetInputModel,
    );
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
      body: {
        'customer': customerId,
      },
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.secretKey,
      headers: {
        'Authorization': "Bearer ${ApiKeys.secretKey}",
        'Stripe-Version': '2024-09-30.acacia',
      },
    );

    var ephemeralKey = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKey;
  }
}
