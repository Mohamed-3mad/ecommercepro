import 'package:dartz/dartz.dart';
import 'package:fruitmarket/data/models/payment_intent_input_model.dart';
import 'package:fruitmarket/utils/exceptions/failures.dart';
abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymenIntentInputModel});
}
