import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foody/Features/category/presentation/views/categories_view.dart';
import 'package:foody/Features/home/presentation/manger/home_state.dart';
import 'package:foody/Features/home/presentation/widgets/products_slider.dart';
import 'package:foody/Features/home/presentation/widgets/search_section.dart';
import 'package:foody/Features/product/domain/entities/product_entity.dart';
import 'package:foody/Features/product/presentation/manger/products_by_category_state.dart';

import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/core/widgets/indicator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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
          appBar: _buildAppBar(),
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
            ? searchBuilder(context)
            : const SizedBox(),
        ProductsSlider(
            context: context,
            title: 'Top Products',
            products: controller.productsController.products),
        controller.productsByCategoryController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ProductsSlider(
                context: context,
                title: controller.categoriesController.currentCategoryId,
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

  Widget searchBuilder(BuildContext context) {
    return ProductsSlider(
      context: context,
      title: controller.productsByTitleController.text.value,
      products: controller.productsByTitleController.products,
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(50.h), // Set this height
      child: SafeArea(
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.only(bottom: 8.h),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Deliver to",
                            style: TextStyle(
                              color: AppColors.gray100,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          SvgPicture.asset("assets/icons/arrow_down.svg"),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "4102 Pretty View Lane",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.orange100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.space28),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppRadius.border12),
                  ),
                  child: Image.asset(
                    "assets/images/user_avatar.png",
                    width: 38.w,
                    height: 38.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
