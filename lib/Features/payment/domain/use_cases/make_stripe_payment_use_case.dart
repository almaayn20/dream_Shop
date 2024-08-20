import 'package:dartz/dartz.dart';
import 'package:foody/Features/order/domain/entities/order_entity.dart';
import 'package:foody/Features/order/domain/repos/order_repo.dart';
import 'package:foody/Features/payment/data/models/payment_intent_input_model.dart';
import 'package:foody/Features/payment/domain/repos/checkout_repo.dart';
import 'package:foody/core/use_cases/use_case.dart';

import '../../../../core/errors/failure.dart';

class MakeStripePaymentUseCase extends UseCase3<void, PaymentIntentInputModel> {
  final CheckoutRepo checkoutRepo;

  MakeStripePaymentUseCase(this.checkoutRepo);

  @override
  Future<Either<Failure, void>> call({required PaymentIntentInputModel param}) {
    return checkoutRepo.makePayment(param);
  }
}
