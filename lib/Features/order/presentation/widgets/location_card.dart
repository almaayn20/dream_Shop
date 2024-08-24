import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Features/order/presentation/manger/add_new_order_state.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/core/widgets/material.dart';
import 'package:get/get.dart';

class LocationCard extends GetView<AddNewOrderController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.border8),
              child: Image.asset(
                'assets/images/location.png',
                width: 80.w,
                height: 100.h,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          SizedBox(width: 8.0.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Home',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10.0.h),
                Text(
                  'location Description',
                  style: TextStyle(
                    color: AppColors.gray100,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
