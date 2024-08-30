import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foody/Features/product/domain/entities/product_entity.dart';
import 'package:foody/Features/product/presentation/views/products_screen.dart';
import 'package:foody/Features/product/presentation/widgets/product_container.dart.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/core/widgets/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ProductsSlider extends StatelessWidget {
  const ProductsSlider(
      {super.key,
      required this.context,
      required this.title,
      required this.products,
      required this.isLodaing});

  final BuildContext context;
  final String title;
  final List<ProductEntity> products;
  final bool isLodaing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.space24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.dark80,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => Get.to(() => ProductsScreen(
                          products: products,
                          isLoading: isLodaing,
                        )),
                    child: Text(
                      ("View All"),
                      style: TextStyle(
                        color: AppColors.orange100,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SvgPicture.asset("assets/icons/arrow_right.svg"),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: AppSpacing.space12),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 252.w,
            child: Obx(
              () => ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ProductContainer(
                    productEntity: products[index],
                    index: index,
                    length: products.length,
                    isLoading: isLodaing,
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
