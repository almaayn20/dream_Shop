import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foody/Features/product/domain/entities/product_entity.dart';
import 'package:foody/core/api_routes.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/shadow.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/core/widgets/back.dart';
import 'package:foody/core/widgets/material.dart';
import 'package:get/get.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({
    super.key,
    required this.productEntity,
    required this.context,
  });

  final ProductEntity productEntity;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      pinned: true,
      snap: true,
      floating: true,
      leading: Container(),
      expandedHeight: 255.w + MediaQuery.of(context).viewPadding.top,
      backgroundColor: AppColors.white100,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).viewPadding.top,
          ),
          alignment: Alignment.topCenter,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppRadius.border16),
                    ),
                    child: Image.network(
                      '${productEntity.productImage}',
                      width: 323.w,
                      height: 190.h,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.space24,
                      vertical: AppSpacing.space8,
                    ),
                    child: Text(
                      productEntity.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.dark80,
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 8.w,
                left: 8.w,
                right: 8.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GetBackCustom(),
                    Container(
                      width: 28.w,
                      height: 28.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: circularRadius(AppRadius.border32),
                        color: productEntity.productId % 2 == 0
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
