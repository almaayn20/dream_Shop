import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Features/order/presentation/manger/add_new_order_state.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/core/widgets/material.dart';
import 'package:get/get.dart';

class OrderProductCard extends GetView<AddNewOrderController> {
  final String imageUrl;
  final String name;
  final double price;
  final int id;
  final int quantity;
  const OrderProductCard(
      {required this.id,
      required this.imageUrl,
      required this.name,
      required this.price,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.border8),
            child: Image.network(
              imageUrl,
              width: 100.w,
              height: 100.h,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(width: 8.0.w),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10.0.h),
                Text(
                  '\$$price',
                  style: TextStyle(
                    color: AppColors.orange100,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Quantity Controls
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => controller.deleteOrderProduct(id - 1),
                icon: Icon(Icons.close),
                color: AppColors.orange100,
                iconSize: 20.0.sp,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => controller.doDecrease(id - 1),
                    child: Container(
                      width: 29.w,
                      height: 29.w,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: AppSpacing.space8),
                    child: Text(
                      quantity.toString(),
                      //       controller.orderProducts[id].productQuantity.toString(),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.doIncrease(id - 1),
                    child: Container(
                      width: 29.w,
                      height: 29.w,
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
              // Remove Button
            ],
          ),
        ],
      ),
    );
  }
}
