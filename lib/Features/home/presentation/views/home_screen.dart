import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Features/category/presentation/views/categories_view.dart';
import 'package:foody/Features/home/presentation/manger/home_state.dart';
import 'package:foody/Features/home/presentation/widgets/products_slider.dart';
import 'package:foody/Features/home/presentation/widgets/search_section.dart';
import 'package:foody/Features/product/domain/entities/product_entity.dart';

import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/widgets/indicator.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.errorMessage.isNotEmpty) {
        return Center(child: Text(controller.errorMessage.value));
      }
      return WrapperIndicator(
        loading: controller.isLoading.value,
        child: Scaffold(
          backgroundColor: AppColors.white100,
          resizeToAvoidBottomInset: true,
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SingleChildScrollView(
              child: _buildContent(context),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildContent(BuildContext context) {
    String categoryTitle = controller
        .categoriesController
        .categories[controller.categoriesController.currentCategoryId.value - 1]
        .categoryTitle;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchSection(),
        SizedBox(height: 30.h),
        CategoriesList(),
        controller.productsByTitleController.text.value.isNotEmpty &&
                controller.productsByTitleController.searchTextController.value
                        .text !=
                    ''
            ? searchStreamBuilder()
            : const SizedBox(),
        ProductsSlider(
            context: context,
            title: 'Top Products',
            products: controller.productsController.products),
        ProductsSlider(
            context: context,
            title: categoryTitle,
            products: controller.productsByCategoryController.products),
      ],
    );
  }

  Widget searchStreamBuilder() {
    return StreamBuilder<List<ProductEntity>>(
      stream: controller.productsByTitleController.productsResult.value,
      builder: (context, snapshot) {
        if (controller.productsByTitleController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.productsByTitleController.errorMessage.isNotEmpty) {
          return Center(
              child: Text(
                  controller.productsByTitleController.errorMessage.value));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.data == null || !snapshot.hasData) {
          return Center(child: Text('No data available'));
        }

        if (snapshot.data!.isEmpty) {
          return ListTile(
            title: Text(
                'No results for: ${controller.productsByTitleController.text.value}'),
          );
        }

        return ProductsSlider(
          context: context,
          title: controller.productsByTitleController.text.value,
          products: snapshot.data!,
        );
      },
    );
  }
}
