import 'package:dartz/dartz.dart';
import 'package:foody/Features/payment/data/models/payment_intent_input_model.dart';
import 'package:foody/core/errors/failure.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      PaymentIntentInputModel paymentIntentInputModel);
}
