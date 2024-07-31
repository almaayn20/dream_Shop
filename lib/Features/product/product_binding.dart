import 'package:foody/Features/login/presentation/manger/welcome_controller.dart';
import 'package:foody/Features/product/presentation/manger/products_state.dart';
import 'package:get/get.dart';

import '../product/data/data_sources/product_local_data_source.dart';
import '../product/domain/use_cases/get_products_use_case.dart';
import '../../core/utils/api_service.dart';
import '../product/data/data_sources/product_remote_data_source.dart';
import '../product/data/repos/product_repo_impl.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
//=============================== Get product ======================================

    Get.lazyPut(() => WelcomeController(), fenix: true);

    Get.lazyPut(() => ProductRemoteDataSourceImpl(Get.find<ApiService>()),
        fenix: true);
    Get.lazyPut(() => ProductLocalDataSourceImpl(), fenix: true);
    Get.lazyPut(
        () => ProductRepoImpl(Get.find<ProductLocalDataSourceImpl>(),
            Get.find<ProductRemoteDataSourceImpl>()),
        fenix: true);

    Get.lazyPut(() => GetProductsUseCase(Get.find<ProductRepoImpl>()),
        fenix: true);

//=============================== Stat Injection The Controllers ======================================

    Get.lazyPut(() => ProductsController(Get.find<GetProductsUseCase>()),
        fenix: true);

//=============================== End Injection The Controllers ======================================

//=============================== general ======================================

    Get.lazyPut(() => ApiService(), fenix: true);
  }
}
