import 'package:foody/Features/maps/presentation/manger/location_selector_state.dart';
import 'package:foody/Features/order/data/data_sources/order_remote_data_source.dart';
import 'package:foody/Features/order/data/repos/order_repo_impl.dart';
import 'package:foody/Features/order/domain/use_cases/add_new_order_use_case.dart';
import 'package:foody/Features/order/presentation/manger/add_new_order_state.dart';
import 'package:get/get.dart';

import '../../core/services/api_service.dart';

class MapsBinding extends Bindings {
  @override
  void dependencies() {
//=============================== Get addresses ======================================

//=============================== Stat Injection The Controllers ======================================

    Get.lazyPut(() => LocationSelectorController(), fenix: true);

//=============================== End Injection The Controllers ======================================

//=============================== general ======================================
  }
}
