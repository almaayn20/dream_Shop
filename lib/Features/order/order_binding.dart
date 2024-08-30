import 'package:foody/Features/maps/maps_binding.dart';
import 'package:foody/Features/order/data/data_sources/order_remote_data_source.dart';
import 'package:foody/Features/order/data/repos/order_repo_impl.dart';
import 'package:foody/Features/order/domain/use_cases/add_new_order_use_case.dart';
import 'package:foody/Features/order/domain/use_cases/get_user_orders_use_case.dart';
import 'package:foody/Features/order/presentation/manger/add_new_order_state.dart';
import 'package:foody/Features/order/presentation/manger/get_user_orders_state.dart';
import 'package:foody/Features/order/presentation/manger/track_order_state.dart';
import 'package:foody/Features/payment/payment_binding.dart';
import 'package:foody/Features/profile/profile_binding.dart';
import 'package:get/get.dart';

import '../../core/services/api_service.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
//=============================== orders ======================================

    MapsBinding().dependencies();
    Get.lazyPut(() => OrderRemoteDataSourceImpl(Get.find<ApiService>()),
        fenix: true);
    Get.lazyPut(() => OrderRepoImpl(Get.find<OrderRemoteDataSourceImpl>()),
        fenix: true);

    Get.lazyPut(() => AddNewOrderUseCase(Get.find<OrderRepoImpl>()),
        fenix: true);

    Get.lazyPut(() => GetUserOrdersUseCase(Get.find<OrderRepoImpl>()),
        fenix: true);

    PaymentBinding().dependencies();

//=============================== Stat Injection The Controllers ======================================

    Get.lazyPut(() => AddNewOrderController(Get.find<AddNewOrderUseCase>()),
        fenix: true);
    Get.lazyPut(() => GetUserOrdersController(Get.find<GetUserOrdersUseCase>()),
        fenix: true);
    Get.lazyPut(() => TrackOrderController(), fenix: true);

//=============================== End Injection The Controllers ======================================

//=============================== general ======================================
  }
}
