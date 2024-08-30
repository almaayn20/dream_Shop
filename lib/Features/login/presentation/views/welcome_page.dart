import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Features/login/presentation/manger/welcome_controller.dart';
import 'package:foody/Features/login/presentation/widgets/sign_up_section.dart';
import 'package:foody/core/constants/colors.dart';

import 'package:foody/core/constants/spacing.dart';

import 'package:get/get.dart';

import '../../../../core/widgets/indicator.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBackground());
  }

  Widget _buildBackground() {
    return Obx(() => WrapperIndicator(
          loading: controller.loading,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/welcome_background.png"),
                fit: BoxFit.cover,
                alignment: Alignment.bottomLeft,
              ),
            ),
            child: SafeArea(
              child: _buildContent(),
            ),
          ),
        ));
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.space28,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
          ),
          _buildMessage(),
          SizedBox(
            height: 110.h,
          ),
          SignUpSection(),
        ],
      ),
    );
  }

  Widget _buildMessage() {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            ("Welcom To"),
            style: TextStyle(
              fontSize: 48.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            ("Dream"),
            style: TextStyle(
              fontSize: 48.sp,
              fontWeight: FontWeight.w900,
              color: AppColors.orange100,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 52.w),
            child: Text(
              ("Best Products delivered fast at your door"),
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.white100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
