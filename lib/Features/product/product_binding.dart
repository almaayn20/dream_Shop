import 'package:foody/Features/login/presentation/manger/welcome_controller.dart';
import 'package:foody/Features/product/domain/use_cases/get_products_by_category_use_case.dart';
import 'package:foody/Features/product/domain/use_cases/get_products_by_title_use_case.dart';
import 'package:foody/Features/product/presentation/manger/product_details_state.dart';
import 'package:foody/Features/product/presentation/manger/products_by_category_state.dart';
import 'package:foody/Features/product/presentation/manger/products_by_title_state.dart';
import 'package:foody/Features/product/presentation/manger/products_top_home_state.dart';
import 'package:get/get.dart';

import '../product/data/data_sources/product_local_data_source.dart';
import '../product/domain/use_cases/get_products_use_case.dart';
import '../../core/utils/api_service.dart';
import '../product/data/data_sources/product_remote_data_source.dart';
import '../product/data/repos/product_repo_impl.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
//=============================== Get product top home ======================================

    Get.lazyPut(() => WelcomeController(), fenix: true);

    Get.lazyPut(() => ProductRemoteDataSourceImpl(Get.find<ApiService>()),
        fenix: true);
    Get.lazyPut(() => ProductLocalDataSourceImpl(), fenix: true);
    Get.lazyPut(
        () => ProductRepoImpl(Get.find<ProductLocalDataSourceImpl>(),
            Get.find<ProductRemoteDataSourceImpl>()),
        fenix: true);

    Get.lazyPut(() => GetProductsTopHomeUseCase(Get.find<ProductRepoImpl>()),
        fenix: true);

//=============================== Get product by category ======================================

    Get.lazyPut(() => GetProductsByCategoryUseCase(Get.find<ProductRepoImpl>()),
        fenix: true);

//=============================== Get product by title ======================================

    Get.lazyPut(() => GetProductsByTitleUseCase(Get.find<ProductRepoImpl>()),
        fenix: true);

//=============================== Stat Injection The Controllers ======================================

    Get.lazyPut(
        () => TopHomeProductsController(Get.find<GetProductsTopHomeUseCase>()),
        fenix: true);

    Get.lazyPut(
        () => ProductsByCategoryController(
            Get.find<GetProductsByCategoryUseCase>()),
        fenix: true);

    Get.lazyPut(
        () => ProductsByTitleController(Get.find<GetProductsByTitleUseCase>()),
        fenix: true);
    Get.lazyPut(() => ProductDetailsController(), fenix: true);

//=============================== End Injection The Controllers ======================================

//=============================== general ======================================

    Get.lazyPut(() => ApiService(), fenix: true);
  }
}
