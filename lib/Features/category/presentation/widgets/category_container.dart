import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Features/category/presentation/manger/category_state.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/shadow.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/core/widgets/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
    required this.isSelected,
    required this.controller,
    required this.index,
    required this.image,
  });

  final bool isSelected;
  final CategoriesController controller;
  final int index;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(bottom: AppSpacing.space28),
        padding: EdgeInsets.all(AppSpacing.space4),
        width: 60.w,
        height: 98.w,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.orange100 : AppColors.white100,
          boxShadow: AppShadow.buttonWhite,
          borderRadius: circularRadius(AppRadius.border32),
        ),
        child: Column(
          children: [
            // Shimmer effect placeholder for the image
            controller.isLoading.value
                ? Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 52.w,
                      height: 52.w,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape
                            .circle, // This makes the container circular
                      ),
                      //     color: Colors.grey[300],
                    ))
                : Image.asset(
                    image,
                    width: 52.w,
                    height: 52.w,
                    fit: BoxFit.cover,
                  ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: AppSpacing.space4),
                child: controller.isLoading.value
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: 40.w,
                          height: 10.h,
                          color: Colors.grey[300],
                        ))
                    : Text(
                        controller.categories[index]
                            .categoryTitle, // Replace with actual title
                        maxLines: 1,
                        style: TextStyle(
                          color: isSelected
                              ? AppColors.white100
                              : AppColors.dark80,
                          fontWeight: FontWeight.w500,
                          fontSize: 11.sp,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
