import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Features/maps/presentation/manger/location_selector_state.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationSelectorScreen extends GetView<LocationSelectorController> {
  LocationSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          GoogleMap(
            markers: controller.markers.value,
            zoomControlsEnabled: false,
            onMapCreated: controller.onMapCreated,
            initialCameraPosition: controller.initialCameraPosition,
            onTap: controller.onMapTap, // Handle user tapping on the map
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: SizedBox(
              height: 50.0.h,
              child: ElevatedButton(
                onPressed: () {
                  navigator?.pop();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.border32),
                  ),
                  backgroundColor: AppColors.orange100,
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.space8),
                  elevation: 0,
                ),
                child: Text(
                  'Save Location',
                  style: TextStyle(
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white100,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
