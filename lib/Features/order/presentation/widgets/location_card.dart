import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Features/maps/presentation/manger/location_selector_state.dart';
import 'package:foody/Features/maps/presentation/views/location_selector_screen.dart';
import 'package:foody/Features/order/presentation/manger/add_new_order_state.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/core/widgets/indicator.dart';
import 'package:foody/core/widgets/material.dart';
import 'package:foody/screen_routes.dart';
import 'package:get/get.dart';

class LocationCard extends GetView<AddNewOrderController> {
  final LocationSelectorController locationSelectorController;

  LocationCard({super.key, required this.locationSelectorController});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // Get.to(LocationSelectorScreen());
              Get.toNamed(ScreensRoutes.locationSelectorScreen);
            },
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
            child: Obx(
              () => locationSelectorController.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${locationSelectorController.geocodedSelectedLocation['country']}, ${locationSelectorController.geocodedSelectedLocation['locality']}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 10.0.h),
                        Text(
                          '${locationSelectorController.geocodedSelectedLocation['street']}',
                          style: TextStyle(
                            color: AppColors.gray100,
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
