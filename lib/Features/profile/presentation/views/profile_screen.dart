import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Features/profile/presentation/manger/get_user_profile_state.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/core/services/size_config.dart';
import 'package:foody/core/widgets/back.dart';
import 'package:foody/core/widgets/error_widget.dart';
import 'package:foody/core/widgets/form_label_field_widget.dart';
import 'package:foody/core/widgets/indicator.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<GetUserProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Obx(() {
      if (controller.errorMessage.isNotEmpty) {
        return errorWidget(errorMessage: controller.errorMessage.value);
      }
      return WrapperIndicator(
        loading: controller.isLoading.value,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: SizeConfig.width / 7),
                    child: Image.asset(
                      'assets/images/profile_header.png',
                    ),
                  ),
                  Positioned(
                    top: 30.h,
                    left: 15.w,
                    child: Padding(
                        padding: EdgeInsets.all(AppSpacing.space12),
                        child: GetBackCustom()),
                  ),
                  Positioned(
                    top: SizeConfig.height / 7.2,
                    left: SizeConfig.width / 3,
                    child: Container(
                      width: 110.w,
                      height: 110.h,
                      padding: EdgeInsets.all(AppSpacing.space12),
                      decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? AppColors.dark80
                            : AppColors.white100,
                        borderRadius: BorderRadius.circular(100.r),
                        boxShadow: [
                          BoxShadow(
                            color: Get.isDarkMode
                                ? AppColors.dark80
                                : AppColors.white100,
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Image.asset(
                          'assets/images/user_avatar.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  controller.profileEntity.value!.userName!,
                  style: theme.textTheme.headline4!.copyWith(fontSize: 18.sp),
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 23.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormLabelFieldWidget(
                        initialValue:
                            controller.profileEntity.value!.userUsername!,
                        hintText: controller.profileEntity.value!.userUsername!,
                        label: 'Username',
                        enabled: false,
                      ),
                      SizedBox(height: 10.h),
                      FormLabelFieldWidget(
                        initialValue:
                            controller.profileEntity.value!.userEmail!,
                        hintText: controller.profileEntity.value!.userEmail!,
                        label: 'E-mail',
                        enabled: false,
                      ),
                      SizedBox(height: 10.h),
                      FormLabelFieldWidget(
                        initialValue:
                            controller.profileEntity.value!.userPhone!,
                        hintText: controller.profileEntity.value!.userPhone!,
                        label: 'Phone',
                        enabled: false,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      );
    });
  }
}
