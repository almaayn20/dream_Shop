import 'package:flutter/material.dart';
import 'package:foody/Features/home/presentation/manger/home_state.dart';
import 'package:foody/Features/product/domain/entities/product_entity.dart';
import 'package:foody/Features/product/presentation/manger/products_base_state.dart';
import 'package:foody/Features/product/presentation/widgets/product_container.dart.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/localization/app_localization.dart';
import 'package:foody/screen_routes.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  final List<ProductEntity> products;
  final bool isLoading;
  final ProductsBaseController controller;

  const ProductsScreen(
      {super.key,
      required this.products,
      required this.isLoading,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.products.tr),
        centerTitle: true,
      ),
      body: Obx(() {
        return Center(
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.space20),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.78,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 5,
                  crossAxisCount: 2),
              children: [
                ...List.generate(
                  products.length,
                  (index) => ProductContainer(
                    productEntity: products[index],
                    index: index,
                    controller: controller,
                    length: products.length,
                    isLoading: isLoading,
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
