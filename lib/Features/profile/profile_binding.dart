import 'package:foody/Features/order/data/data_sources/order_remote_data_source.dart';
import 'package:foody/Features/order/data/repos/order_repo_impl.dart';
import 'package:foody/Features/order/domain/use_cases/add_new_order_use_case.dart';
import 'package:foody/Features/order/domain/use_cases/get_user_orders_use_case.dart';
import 'package:foody/Features/order/presentation/manger/add_new_order_state.dart';
import 'package:foody/Features/order/presentation/manger/get_user_orders_state.dart';
import 'package:foody/Features/order/presentation/manger/track_order_state.dart';
import 'package:foody/Features/payment/payment_binding.dart';
import 'package:foody/Features/profile/data/data_sources/profile_local_data_source.dart';
import 'package:foody/Features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:foody/Features/profile/data/repos/profile_repo_impl.dart';
import 'package:foody/Features/profile/domain/use_cases/get_user_profile_use_case.dart';
import 'package:foody/Features/profile/presentation/manger/get_user_profile_state.dart';
import 'package:get/get.dart';

import '../../core/utils/api_service.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
//=============================== orders ======================================

    Get.lazyPut(() => ProfileRemoteDataSourceImpl(Get.find<ApiService>()),
        fenix: true);
    Get.lazyPut(() => ProfileLocalDataSourceImpl(), fenix: true);
    Get.lazyPut(
        () => ProfileRepoImpl(Get.find<ProfileRemoteDataSourceImpl>(),
            Get.find<ProfileLocalDataSourceImpl>()),
        fenix: true);

    Get.lazyPut(() => GetUserProfileUseCase(Get.find<ProfileRepoImpl>()),
        fenix: true);

//=============================== Stat Injection The Controllers ======================================

    Get.lazyPut(
        () => GetUserProfileController(Get.find<GetUserProfileUseCase>()),
        fenix: true);

//=============================== End Injection The Controllers ======================================

//=============================== general ======================================
  }
}
