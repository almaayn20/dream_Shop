import 'package:get/get.dart';

import '../../../../core/use_cases/use_case.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/use_cases/get_products_use_case.dart';

class ProductsController extends GetxController {
  final GetProductsUseCase getProductsUseCase;

  ProductsController(this.getProductsUseCase);

  var isLoading = false.obs;
  var products = <ProductEntity>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    var result = await getProductsUseCase.call(NoParam());
    result.fold((failure) {
      errorMessage.value = failure.message;
    }, (fetchedProducts) {
      products.value = fetchedProducts;
    });
    isLoading.value = false;
  }
}
