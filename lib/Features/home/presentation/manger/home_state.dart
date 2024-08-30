import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foody/Features/category/domain/entities/category_entity.dart';
import 'package:foody/Features/category/domain/use_cases/get_all_categories_use_case.dart';
import 'package:foody/Features/category/presentation/manger/category_state.dart';
import 'package:foody/Features/product/presentation/manger/products_by_category_state.dart';
import 'package:foody/Features/product/presentation/manger/products_by_title_state.dart';
import 'package:foody/Features/product/presentation/manger/products_top_home_state.dart';
import 'package:get/get.dart';

import '../../../../core/use_cases/use_case.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  CategoriesController categoriesController = Get.find();
  TopHomeProductsController productsController = Get.find();
  ProductsByCategoryController productsByCategoryController = Get.find();
  ProductsByTitleController productsByTitleController = Get.find();

  @override
  void onInit() async {
    await fetchData();

    super.onInit();
  }

  Future<void> fetchData() async {
    isLoading.value = true;
    await categoriesController.fetchCategories();
    await productsController.fetchProductsTopHome();

    await productsByCategoryController
        .fetchProductsByCategory(categoriesController.currentCategoryId);

    if (categoriesController.errorMessage.isNotEmpty ||
        productsController.errorMessage.isNotEmpty ||
        productsByCategoryController.errorMessage.isNotEmpty) {
      errorMessage.value =
          '${categoriesController.errorMessage.value}  ${productsController.errorMessage.value}  ${productsByCategoryController.errorMessage.value}';
    }
    isLoading.value = false;
  }
}
