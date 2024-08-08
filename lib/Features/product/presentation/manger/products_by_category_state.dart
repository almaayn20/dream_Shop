import 'package:foody/Features/product/domain/use_cases/get_products_by_category_use_case.dart';
import 'package:foody/Features/product/presentation/manger/products_base_state.dart';
import 'package:get/get.dart';

import '../../domain/entities/product_entity.dart';

class ProductsByCategoryController extends ProductsBaseController {
  final GetProductsByCategoryUseCase getProductsByCategoryUseCase;

  ProductsByCategoryController(this.getProductsByCategoryUseCase);

  Future<void> fetchProductsByCategory(int categoryId) async {
    isLoading.value = true;
    var result = await getProductsByCategoryUseCase.call(param: categoryId);
    result.fold((failure) {
      errorMessage.value = failure.message;
    }, (fetchedProducts) {
      products.value = fetchedProducts;
    });
    isLoading.value = false;
  }
}
