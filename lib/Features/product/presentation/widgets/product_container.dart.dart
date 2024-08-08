import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foody/Features/product/domain/entities/product_entity.dart';
import 'package:foody/Features/product/presentation/views/product_details_screen.dart';
import 'package:foody/core/api_routes.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/shadow.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/core/widgets/material.dart';
import 'package:get/get.dart';

class ProductContainer extends StatelessWidget {
  final ProductEntity product;
  final int index;
  final int length;
  ProductContainer(
      {Key? key,
      required this.product,
      required this.index,
      required this.length})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.only(
          bottom: AppSpacing.space28,
          left: index == 0 ? AppSpacing.space24 : 0,
          right: index == length - 1 ? AppSpacing.space24 : 16.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.white100,
          boxShadow: AppShadow.buttonWhite,
          borderRadius: circularRadius(AppRadius.border16),
        ),
        width: 154.w,
        child: GestureDetector(
          onTap: () => Get.to(ProductDetailScreen(productEntity: product)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItemImage(),
              ItemInformation(),
            ],
          ),
        ));
  }

  Container ItemImage() {
    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              Image.network(
                '${ApiConstants.baseUrl}/${product.image}',
                width: 154.w,
                height: 160.w,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 14.w),
            ],
          ),
          Positioned(
            left: AppSpacing.space12,
            right: AppSpacing.space12,
            top: AppSpacing.space12,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(AppSpacing.space8),
                  decoration: BoxDecoration(
                    color: AppColors.white100,
                    borderRadius: circularRadius(AppRadius.border32),
                  ),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "\$",
                          style: TextStyle(
                            color: AppColors.orange100,
                            fontSize: 8.sp,
                          ),
                          children: [
                            TextSpan(
                              text: product.productPrice.toString(),
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w900,
                                color: AppColors.dark80,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 28.w,
                    height: 28.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: circularRadius(AppRadius.border32),
                      color: product.productId % 2 == 0
                          ? AppColors.orange100
                          : AppColors.white21,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/heart_circle.svg",
                      width: 14.w,
                      height: 14.w,
                      color: AppColors.white100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: AppSpacing.space12,
            bottom: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.space8),
                  height: 28.w,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: AppColors.white100,
                    borderRadius: circularRadius(AppRadius.border32),
                    boxShadow: AppShadow.buttonWhite,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.dark80,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      SvgPicture.asset(
                        "assets/icons/star.svg",
                        width: 10.w,
                        height: 10.w,
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        "(${4.5 > 25 ? "25+" : 4.5})",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 9.sp,
                          color: AppColors.gray100,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ItemInformation() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          left: AppSpacing.space16,
          right: AppSpacing.space16,
          bottom: AppSpacing.space8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              product.name,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.dark80,
              ),
            ),
            Text(
              product.productDescription,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w300,
                color: AppColors.gray100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
