import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/shadow.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/core/widgets/snack_bar.dart';
import 'package:foody/screen_routes.dart';
import 'package:get/get.dart';

class SignUpSection extends StatelessWidget {
  const SignUpSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 84.w,
              child: const Divider(
                color: AppColors.white100,
                thickness: 1,
              ),
            ),
            Text(
              ("sign up with"),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.white100,
              ),
            ),
            SizedBox(
              width: 84.w,
              child: const Divider(
                color: AppColors.white100,
                thickness: 1,
              ),
            )
          ],
        ),
        SizedBox(
          height: 18.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                snackBarCustom(
                    context,
                    'Sign up is currently suspended, Login with these credentials',
                    '',
                    () {});
                Get.toNamed(ScreensRoutes.loginScreen);
              },
              child: Container(
                width: 140.w,
                height: 54.w,
                padding: EdgeInsets.only(
                  left: AppSpacing.space12,
                  right: AppSpacing.space16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white100,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppRadius.border28),
                  ),
                  boxShadow: AppShadow.button,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/facebook_circle.svg",
                      width: 30.w,
                      height: 30.w,
                    ),
                    Expanded(
                      child: Center(child: Text(("facebook").toUpperCase())),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                snackBarCustom(
                    context,
                    'Sign up is currently suspended, Login with these credentials',
                    '',
                    () {});
                Get.toNamed(ScreensRoutes.loginScreen);
              },
              child: Container(
                width: 140.w,
                height: 54.w,
                padding: EdgeInsets.only(
                  left: AppSpacing.space12,
                  right: AppSpacing.space16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white100,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppRadius.border28),
                  ),
                  boxShadow: AppShadow.button,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/google_circle.svg",
                      width: 30.w,
                      height: 30.w,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(("google").toUpperCase()),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 24.h,
        ),
        GestureDetector(
          onTap: () {
            snackBarCustom(
                context,
                'Sign up is currently suspended, Login with these credentials',
                '',
                () {});
            Get.toNamed(ScreensRoutes.loginScreen);
          },
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            height: 54.w,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(AppRadius.border28)),
              border: Border.all(
                color: AppColors.white100,
                width: 2,
              ),
              boxShadow: AppShadow.button,
              color: AppColors.white21,
            ),
            child: Text(
              ("start with phone number"),
              style: TextStyle(
                color: AppColors.white100,
                fontWeight: FontWeight.w500,
                fontSize: 17.sp,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        RichText(
          text: TextSpan(
            text: ("Have Account ? "),
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16.sp,
            ),
            children: [
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(ScreensRoutes.loginScreen);
                    },
                  text: ("Sign In"),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
