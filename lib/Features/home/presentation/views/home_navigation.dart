import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foody/Features/home/presentation/manger/home_navigation_state.dart';
import 'package:foody/Features/home/presentation/widgets/bottom_app_bar.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/shadow.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/Features/home/data/models/home_navigation_model.dart';
import 'package:foody/core/widgets/material.dart';
import 'package:get/get.dart';

class HomeNavigationScreen extends GetView<HomeNavigationController> {
  HomeNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        key: controller.key,
        appBar: _buildAppBar(),
        bottomNavigationBar: BottomTabBar(
          pages: controller.pages,
          onItemTapped: controller.onItemTapped,
          selectedIndex: controller.selectedIndex,
        ),
        backgroundColor: AppColors.white100,
        body: controller.pages[controller.selectedIndex].page,
      );
    });
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(50.h), // Set this height
      child: SafeArea(
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.only(bottom: 8.h),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Deliver to",
                            style: TextStyle(
                              color: AppColors.gray100,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          SvgPicture.asset("assets/icons/arrow_down.svg"),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "4102 Pretty View Lane",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.orange100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.space28),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppRadius.border12),
                  ),
                  child: Image.asset(
                    "assets/images/user_avatar.png",
                    width: 38.w,
                    height: 38.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
