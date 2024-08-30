import 'package:foody/Features/login/presentation/manger/login_controller.dart';
import 'package:foody/Features/login/presentation/manger/welcome_controller.dart';
import 'package:get/get.dart';

import '../../core/services/api_service.dart';
import 'data/data_sources/user_remote_data_source.dart';
import 'data/repos/user_repo_impl.dart';
import 'domain/use_cases/login_use_case.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
//=============================== welcome ======================================

    Get.lazyPut(() => WelcomeController(), fenix: true);

//=============================== login ======================================

    Get.lazyPut(() => UserRemoteDataSourceImpl(Get.find<ApiService>()),
        fenix: true);
    Get.lazyPut(() => UserRepoImpl(Get.find<UserRemoteDataSourceImpl>()),
        fenix: true);

    Get.lazyPut(() => LoginUseCase(Get.find<UserRepoImpl>()), fenix: true);

//=============================== Stat Injection The Controllers ======================================

    Get.lazyPut(() => LoginController(Get.find<LoginUseCase>()), fenix: true);

//=============================== End Injection The Controllers ======================================

//=============================== general ======================================

    Get.lazyPut(() => ApiService(), fenix: true);
  }

  static void dispose() {
    Get.delete<ApiService>();
  }
}
