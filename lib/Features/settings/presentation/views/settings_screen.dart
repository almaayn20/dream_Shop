import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foody/Features/profile/presentation/manger/get_user_profile_state.dart';
import 'package:foody/Features/settings/presentation/manger/settings_state.dart';
import 'package:foody/Features/settings/presentation/widgets/settings_item.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/shadow.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/core/widgets/material.dart';
import 'package:foody/screen_routes.dart';
import 'package:get/get.dart';

class SettingsScreen extends GetView<SettingsController> {
  SettingsScreen({super.key});

  final GetUserProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.space24,
          vertical: AppSpacing.space24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: AppSpacing.space4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: circularRadius(90.w / 2),
                      boxShadow: AppShadow.button,
                      color: AppColors.white100,
                    ),
                    child: Image.asset(
                      "assets/images/user_avatar.png",
                      width: 90.w,
                      height: 90.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    profileController.profileEntity.value!.userName!,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.dark80,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    profileController.profileEntity.value!.userEmail!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.gray100,
                    ),
                  ),
                  SizedBox(height: 4.h),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    SettingsItem(
                      icon: "assets/icons/person.svg",
                      label: "My Profile",
                      onTap: () => Get.toNamed(ScreensRoutes.profileScreen),
                    ),
                    const SettingsItem(
                      icon: "assets/icons/language.svg",
                      label: "Language",
                    ),
                    const SettingsItem(
                      icon: "assets/icons/theme.svg",
                      label: "Theme",
                    ),
                    const SettingsItem(
                      icon: "assets/icons/mail.svg",
                      label: "Contact Us",
                    ),
                    const SettingsItem(
                      icon: "assets/icons/faq.svg",
                      label: "Helps & FAQs",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 4.h),
            GestureDetector(
              onTap: controller.logOut,
              child: Container(
                margin: EdgeInsets.only(top: AppSpacing.space4),
                padding: EdgeInsets.fromLTRB(
                  AppSpacing.space12,
                  AppSpacing.space12,
                  AppSpacing.space16,
                  AppSpacing.space12,
                ),
                decoration: BoxDecoration(
                  borderRadius: circularRadius(AppRadius.border32),
                  boxShadow: AppShadow.buttonWhite,
                  color: AppColors.orange100,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/power.svg",
                      width: 26.w,
                      height: 26.w,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      ("Log Out"),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                        color: AppColors.white100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
