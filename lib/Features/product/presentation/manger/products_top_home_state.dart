import 'package:foody/Features/product/presentation/manger/products_base_state.dart';
import 'package:get/get.dart';

import '../../../../core/use_cases/use_case.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/use_cases/get_products_use_case.dart';

class TopHomeProductsController extends ProductsBaseController {
  final GetProductsTopHomeUseCase getProductsTopHomeUseCase;

  TopHomeProductsController(this.getProductsTopHomeUseCase);

  @override
  void onInit() {
    fetchProductsTopHome();
    super.onInit();
  }

  Future<void> fetchProductsTopHome() async {
    isLoading.value = true;
    var result = await getProductsTopHomeUseCase.call(NoParam());
    result.fold((failure) {
      errorMessage.value = failure.message;
    }, (fetchedProducts) {
      products.value = fetchedProducts;
    });
    isLoading.value = false;
  }
}
