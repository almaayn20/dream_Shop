import 'package:foody/Features/order/data/data_sources/order_remote_data_source.dart';
import 'package:foody/Features/order/data/repos/order_repo_impl.dart';
import 'package:foody/Features/order/domain/use_cases/add_new_order_use_case.dart';
import 'package:foody/Features/order/presentation/manger/add_new_order_state.dart';
import 'package:get/get.dart';

import '../../core/utils/api_service.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
//=============================== Get product ======================================

    Get.lazyPut(() => OrderRemoteDataSourceImpl(Get.find<ApiService>()),
        fenix: true);
    Get.lazyPut(() => OrderRepoImpl(Get.find<OrderRemoteDataSourceImpl>()),
        fenix: true);

    Get.lazyPut(() => AddNewOrderUseCase(Get.find<OrderRepoImpl>()),
        fenix: true);

//=============================== Stat Injection The Controllers ======================================

    Get.lazyPut(() => AddNewOrderController(Get.find<AddNewOrderUseCase>()),
        fenix: true);

//=============================== End Injection The Controllers ======================================

//=============================== general ======================================
  }
}
