import 'package:fruitmarket/features/shop/controllers/cart_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fruitmarket/data/models/payment_intent_input_model.dart';
import 'package:fruitmarket/data/repositories/checkout/payment_repository.dart';

class PaymentController extends GetxController {
  final PaymentRepository paymentRepository;

  PaymentController(this.paymentRepository);
  final CartController cartController = Get.put(CartController());

  var isLoading = false.obs;
  var paymentSuccess = false.obs;
  var errorMessage = ''.obs;

  // Function to create Stripe customer and initiate payment process
  Future<bool> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
    required String email,
  }) async {
    isLoading.value = true;
    try {
      // Step 1: Create customer
      String? customerId = await paymentRepository.createStripeCustomer(email);

      if (customerId == null) {
        errorMessage.value = 'Failed to create customer';
        isLoading.value = false;
        return false;
      }

      // Step 2: Create Ephemeral Key
      var ephemeralKey = await paymentRepository.createEphemeralKey(customerId);
      if (ephemeralKey == null) {
        errorMessage.value = 'Failed to create ephemeral key';
        isLoading.value = false;
        return false;
      }

      // Step 3: Create Payment Intent
      var paymentIntent =
          await paymentRepository.createPaymentIntent(paymentIntentInputModel);
      if (paymentIntent == null) {
        errorMessage.value = 'Failed to create payment intent';
        isLoading.value = false;
        return false;
      }

      // Step 4: Initialize the Payment Sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent.clientSecret,
          customerEphemeralKeySecret: ephemeralKey.secret,
          customerId: customerId,
          merchantDisplayName: 'Mohamed Emad',
        ),
      );

      // Step 5: Present the Payment Sheet
      await Stripe.instance.presentPaymentSheet();

      // If the payment is successful, set the success status
      paymentSuccess.value = true;

      // Clear the cart after successful payment
      cartController.clearCart();
      return true;
    } catch (e) {
      // Handle any exceptions that may occur
      errorMessage.value = 'Payment failed: ${e.toString()}';
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
