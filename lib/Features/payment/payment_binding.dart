import 'package:foody/Features/order/data/data_sources/order_remote_data_source.dart';
import 'package:foody/Features/order/data/repos/order_repo_impl.dart';
import 'package:foody/Features/order/domain/use_cases/add_new_order_use_case.dart';
import 'package:foody/Features/order/presentation/manger/add_new_order_state.dart';
import 'package:foody/Features/payment/data/data_sources/payment_remote_data_source.dart';
import 'package:foody/Features/payment/data/repos/checkout_repo_impl.dart';
import 'package:foody/Features/payment/domain/use_cases/make_stripe_payment_use_case.dart';
import 'package:foody/Features/payment/presentation/manger/payment_state.dart';
import 'package:get/get.dart';

import '../../core/utils/api_service.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentRemoteDataSourceImpl(Get.find<ApiService>()),
        fenix: true);
    Get.lazyPut(() => CheckoutRepoImpl(Get.find<PaymentRemoteDataSourceImpl>()),
        fenix: true);

    Get.lazyPut(() => MakeStripePaymentUseCase(Get.find<CheckoutRepoImpl>()),
        fenix: true);

//=============================== Stat Injection The Controllers ======================================

    Get.lazyPut(() => PaymentController(Get.find<MakeStripePaymentUseCase>()),
        fenix: true);

//=============================== End Injection The Controllers ======================================

//=============================== general ======================================
  }
}
