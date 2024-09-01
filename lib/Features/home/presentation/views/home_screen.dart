import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foody/Features/category/presentation/manger/category_state.dart';
import 'package:foody/Features/category/presentation/views/categories_view.dart';
import 'package:foody/Features/home/presentation/manger/home_state.dart';
import 'package:foody/Features/home/presentation/widgets/products_slider.dart';
import 'package:foody/Features/home/presentation/widgets/search_section.dart';
import 'package:foody/Features/product/domain/entities/product_entity.dart';
import 'package:foody/Features/product/presentation/manger/products_by_category_state.dart';
import 'package:foody/Features/profile/presentation/manger/get_user_profile_state.dart';

import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/core/services/network_info.dart';
import 'package:foody/core/widgets/error_widget.dart';
import 'package:foody/core/widgets/indicator.dart';
import 'package:foody/core/widgets/no_internet_widget.dart';
import 'package:foody/screen_routes.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  final CategoriesController categoriesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return WrapperIndicator(
        loading: categoriesController.isLoading.value,
        child: Scaffold(
          appBar: _buildAppBar(),
          backgroundColor: AppColors.white100,
          resizeToAvoidBottomInset: true,
          body: GestureDetector(
            onPanDown: (_) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: controller.errorMessage.value.isNotEmpty
                ? errorWidget(errorMessage: controller.errorMessage.value)
                : SingleChildScrollView(
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
        controller.errorMessage.isNotEmpty
            ? errorWidget(errorMessage: controller.errorMessage.value)
            : Column(
                children: [
                  SizedBox(height: 30.h),
                  CategoriesList(),
                  controller.productsByTitleController.text.value.isNotEmpty &&
                          controller.productsByTitleController
                                  .searchTextController.value.text !=
                              ''
                      ? searchBuilder(context)
                      : const SizedBox(),
                  ProductsSlider(
                    context: context,
                    title: controller.categoriesController.currentCategoryId,
                    products: controller.productsByCategoryController.products,
                    isLodaing:
                        controller.productsByCategoryController.isLoading.value,
                    controller: controller.productsByCategoryController,
                  ),
                  ProductsSlider(
                    context: context,
                    title: 'Top Products',
                    products: controller.productsController.products,
                    isLodaing: controller.isLoading.value,
                    controller: controller.productsController,
                  ),
                ],
              )
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
          isLodaing: controller.productsByTitleController.isLoading.value,
          controller: controller.productsByTitleController,
        );
      },
    );
  }

  Widget searchBuilder(BuildContext context) {
    return ProductsSlider(
      context: context,
      title: controller.productsByTitleController.text.value,
      products: controller.productsByTitleController.products,
      isLodaing: controller.productsByTitleController.isLoading.value,
      controller: controller.productsByTitleController,
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(54.h), // Set this height
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome to",
                          style: TextStyle(
                            color: AppColors.gray100,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Text(
                        'Dream Shop',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w800,
                          color: AppColors.orange100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.space28),
                child: InkWell(
                  onTap: () => Get.toNamed(ScreensRoutes.profileScreen),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
