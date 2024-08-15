import 'package:flutter/material.dart';
import 'package:foody/Features/product/domain/entities/product_entity.dart';
import 'package:foody/Features/product/domain/use_cases/get_products_by_title_use_case.dart';
import 'package:foody/Features/product/presentation/manger/products_base_state.dart';
import 'package:foody/Features/product/presentation/manger/products_top_home_state.dart';
import 'package:foody/core/helper/app_print_class.dart';
import 'package:get/get.dart';

class ProductsByTitleController extends ProductsBaseController {
  final GetProductsByTitleUseCase getProductsByTitleUseCase;
  final TopHomeProductsController topHomeProductsController = Get.find();
  var searchTextController = TextEditingController().obs;
  RxString text = ''.obs;

  Rx<Stream<List<ProductEntity>>> productsResult =
      Stream<List<ProductEntity>>.empty().obs;

  ProductsByTitleController(this.getProductsByTitleUseCase);

  Future<void> fetchProductsByTitle(String searchWord) async {
    isLoading.value = true;
    text.value = searchWord;
    var result = await getProductsByTitleUseCase.call(param: searchWord);
    result.fold((failure) {
      errorMessage.value = failure.message;
    }, (fetchedProducts) {
      productsResult.value = fetchedProducts;
    });
    isLoading.value = false;
  }

  Future<void> fetchProductsByTitle2(String searchWord) async {
    isLoading.value = true;
    text.value = searchWord;
    if (topHomeProductsController.products.isNotEmpty) {
      products.value = topHomeProductsController.products
          .where((element) =>
              element.name.contains(searchWord)) // Filter products by name
          .toList();
    } else {
      errorMessage = topHomeProductsController.errorMessage;
    }
    isLoading.value = false;
  }
}
