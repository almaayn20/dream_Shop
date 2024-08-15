import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foody/Features/product/presentation/manger/products_by_title_state.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:get/get.dart';

class searchWidget extends GetView<ProductsByTitleController> {
  const searchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 52.w,
            child: TextField(
              onChanged: (text) => controller.fetchProductsByTitle2(text),
              controller: controller.searchTextController.value,
              decoration: InputDecoration(
                prefixIcon: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.space20,
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/search.svg",
                    width: 16.w,
                    height: 16.w,
                  ),
                ),
                hintText: ("Find Product"),
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: AppColors.gray100,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
