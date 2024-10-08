import 'package:foody/Features/product/domain/use_cases/get_products_by_category_use_case.dart';
import 'package:get/get.dart';

import '../../domain/entities/product_entity.dart';

abstract class ProductsBaseController extends GetxController {
  var isLoading = false.obs;
  var products = <ProductEntity>[].obs;
  var errorMessage = ''.obs;

  void doMakeFavouriteProduct(int id) {
    final item = products.indexWhere((element) => element.productId == id);
    products[item].isFavorite = !products[item].isFavorite!;
    products.refresh();
  }
}
