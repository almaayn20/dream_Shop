import 'package:foody/Features/payment/data/models/payment_intent_input_model.dart';
import 'package:foody/Features/payment/domain/use_cases/make_stripe_payment_use_case.dart';

import 'package:get/get.dart';

class PaymentController extends GetxController {
  final MakeStripePaymentUseCase makeStripePaymentUseCase;

  PaymentController(this.makeStripePaymentUseCase);

  var errorMessage = ''.obs;
  var isLoading = false.obs;
  var paymentDone = false.obs;
  var activeIndex = 0.obs;

  Future<void> makeStripePayment(
      PaymentIntentInputModel paymentIntentInputModel) async {
    isLoading.value = true;
    errorMessage.value = '';
    final result =
        await makeStripePaymentUseCase.call(param: paymentIntentInputModel);

    result.fold((failure) {
      errorMessage.value = failure.message;
    }, (suceess) {});
    isLoading.value = false;
  }
}
