import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Features/product/domain/entities/product_entity.dart';
import 'package:foody/Features/product/presentation/manger/product_details_state.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/core/widgets/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class productQuantity extends StatelessWidget {
  const productQuantity({
    super.key,
    required this.productEntity,
    required this.controller,
  });

  final ProductEntity productEntity;
  final ProductDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: "\$",
            style: TextStyle(
              color: AppColors.orange100,
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
            ),
            children: [
              TextSpan(
                text: productEntity.productPrice.toString(),
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: controller.doDecrease,
              child: Container(
                width: 30.w,
                height: 30.w,
                decoration: BoxDecoration(
                  borderRadius: circularRadius(AppRadius.border32),
                  border: Border.all(
                    color: AppColors.orange100,
                  ),
                ),
                child: Icon(
                  Icons.remove,
                  color: AppColors.orange100,
                  size: 16.w,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.space8),
              child: Obx(
                () => Text(
                  controller.quantity.toString(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: controller.doIncrease,
              child: Container(
                width: 30.w,
                height: 30.w,
                decoration: BoxDecoration(
                  borderRadius: circularRadius(AppRadius.border32),
                  border: Border.all(
                    color: AppColors.orange100,
                  ),
                  color: AppColors.orange100,
                ),
                child: Icon(
                  Icons.add,
                  color: AppColors.white100,
                  size: 16.w,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
