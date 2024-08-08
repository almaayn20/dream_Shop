import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Features/category/presentation/manger/category_state.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/shadow.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/core/widgets/material.dart';

class categoryContainer extends StatelessWidget {
  const categoryContainer({
    super.key,
    required this.isSelected,
    required this.controller,
    required this.index,
  });

  final bool isSelected;
  final CategoriesController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Image.asset(
            'assets/images/categories/burger.png',
            width: 52.w,
            height: 52.w,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: AppSpacing.space4),
              // color: Colors.red,
              child: Text(
                controller.categories[index].categoryTitle,
                maxLines: 1,
                style: TextStyle(
                  color: isSelected ? AppColors.white100 : AppColors.dark80,
                  fontWeight: FontWeight.w500,
                  fontSize: 11.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
