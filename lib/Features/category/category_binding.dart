import 'package:foody/Features/category/data/data_sources/category_remote_data_source.dart';
import 'package:foody/Features/category/data/repos/category_repo_impl.dart';
import 'package:foody/Features/category/domain/use_cases/get_all_categories_use_case.dart';
import 'package:foody/Features/category/presentation/manger/category_state.dart';
import 'package:get/get.dart';

import '../../core/services/api_service.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
//=============================== Get product ======================================

    Get.lazyPut(() => CategoryRemoteDataSourceImpl(Get.find<ApiService>()),
        fenix: true);
    Get.lazyPut(
        () => CategoryRepoImpl(Get.find<CategoryRemoteDataSourceImpl>()),
        fenix: true);

    Get.lazyPut(() => GetAllCategoriesUseCase(Get.find<CategoryRepoImpl>()),
        fenix: true);

//=============================== Stat Injection The Controllers ======================================

    Get.lazyPut(() => CategoriesController(Get.find<GetAllCategoriesUseCase>()),
        fenix: true);

//=============================== End Injection The Controllers ======================================

//=============================== general ======================================

    Get.lazyPut(() => ApiService(), fenix: true);
  }
}
