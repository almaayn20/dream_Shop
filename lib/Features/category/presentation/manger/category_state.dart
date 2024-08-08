import 'package:foody/Features/category/domain/entities/category_entity.dart';
import 'package:foody/Features/category/domain/use_cases/get_all_categories_use_case.dart';
import 'package:foody/Features/product/presentation/manger/products_by_category_state.dart';
import 'package:get/get.dart';

import '../../../../core/use_cases/use_case.dart';

class CategoriesController extends GetxController {
  final GetAllCategoriesUseCase getAllCategoriesUseCase;

  var isLoading = false.obs;
  var categories = <CategoryEntity>[].obs;
  var errorMessage = ''.obs;

  var currentCategoryId = 1.obs;

  final ProductsByCategoryController productsByCategoryController = Get.find();

  CategoriesController(this.getAllCategoriesUseCase);

  @override
  void onInit() {
    fetchCategories();
    productsByCategoryController
        .fetchProductsByCategory(currentCategoryId.value);
    super.onInit();
  }

  void onSelectCategory(int id) async {
    currentCategoryId.value = id;
    categories.refresh();
    productsByCategoryController
        .fetchProductsByCategory(currentCategoryId.value);
  }

  Future<void> fetchCategories() async {
    isLoading.value = true;
    var result = await getAllCategoriesUseCase.call(NoParam());
    result.fold((failure) {
      errorMessage.value = failure.message;
    }, (fetchedCategories) {
      categories.value = fetchedCategories;
      currentCategoryId.value = categories.first.categoryId;
    });
    isLoading.value = false;
  }
}
