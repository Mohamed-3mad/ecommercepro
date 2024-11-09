import 'package:dartz/dartz.dart';
import 'package:fruitmarket/data/models/payment_intent_input_model.dart';
import 'package:fruitmarket/data/repositories/checkout/chekout_repo.dart';
import 'package:fruitmarket/utils/exceptions/failures.dart';
import 'package:fruitmarket/utils/stripe/stripe_service.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymenIntentInputModel}) async {
    try {
      await stripeService.makePayment(paymenIntentInputModel: paymenIntentInputModel);
      return right(null);  // Return success
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));  // Return error
    }
  }
}
