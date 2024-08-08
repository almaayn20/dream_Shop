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
import 'package:foody/core/widgets/material.dart';
import 'package:get/get.dart';

class productDetailsAppBar extends StatelessWidget {
  const productDetailsAppBar({
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
      expandedHeight: 228.w + MediaQuery.of(context).viewPadding.top,
      backgroundColor: AppColors.white100,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        expandedTitleScale: 1.4,
        titlePadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.space24,
          vertical: AppSpacing.space12,
        ),
        centerTitle: false,
        title: Text(
          productEntity.name,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: AppColors.dark80,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        background: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).viewPadding.top,
          ),
          alignment: Alignment.topCenter,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // CarouselSlider.builder(
              //   itemCount: imagesProducts.length,
              //   options: CarouselOptions(viewportFraction: 1.0, autoPlay: true),
              //   itemBuilder: (context, i, realIndex) => Container(
              //     width: size.width,
              //     child: Image.network(
              //         Environment.endpointBase + imagesProducts[i].picture),
              //   ),
              // ),
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    AppRadius.border16,
                  ),
                ),
                child: Image.network(
                  '${ApiConstants.baseUrl}/${productEntity.image}',
                  width: 323.w,
                  height: 206.w,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Positioned(
                top: 8.w,
                left: 8.w,
                right: 8.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        width: 38.w,
                        height: 38.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.white100,
                          borderRadius: circularRadius(AppRadius.border12),
                          boxShadow: AppShadow.buttonWhite,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 14.w,
                        ),
                      ),
                    ),
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
