import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Features/login/presentation/manger/login_controller.dart';

import 'package:foody/Features/login/presentation/views/widgets/button_widget.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/core/hive_boxes/auth_box.dart';
import 'package:foody/core/widgets/back.dart';
import 'package:foody/core/widgets/snack_bar.dart';
import 'package:foody/screen_routes.dart';
import 'package:get/get.dart';
import 'widgets/login_form_widget.dart';

class LoginContent extends StatelessWidget {
  final LoginController controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  LoginContent({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.asset('assets/images/header.png'),
            Padding(
              padding: const EdgeInsets.only(
                top: 37,
                left: 27,
              ),
              child: GetBackCustom(),
            )
          ],
        ),
        SizedBox(height: 92.0.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Sign In',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontSize: 34.sp,
                      color:
                          Get.isDarkMode ? AppColors.gray50 : AppColors.dark100,
                    ),
              ),
              SizedBox(height: 38.0.h),
              Form(
                key: _formKey,
                child: LoginFormWidget(
                  emailController: email,
                  passwordController: password,
                  controller: controller,
                ),
              ),
              SizedBox(height: 32.0.h),
              // Center(
              //   child: InkWell(
              //       onTap: () => snackBarCustom(
              //           context, 'Forgot password?', '', () => null)),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 42.0.w),
                child: ButtonWidget(
                  onPress: () async {
                    if (_formKey.currentState!.validate()) {
                      await controller.login(email.text, password.text);
                      if (AuthBox.isUserLoggedIn()) {
                        Get.offAllNamed(ScreensRoutes.homeScreen);
                      } else {
                        // controller.errorMessage.value
                        Get.snackbar('Error', 'Invalid email or password');
                      }
                    }
                  },
                  title: 'LOGIN',
                  buttonColor: AppColors.orange100,
                  titleColor: AppColors.white100,
                  borderColor: AppColors.orange100,
                  paddingHorizontal: 22.0.w,
                  paddingVertical: 22.0.h,
                ),
              ),
              SizedBox(height: 32.0.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('User name : johnd',
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text(r'Password: m38rmF$',
                      textDirection: TextDirection.ltr,
                      style: Theme.of(context).textTheme.bodyLarge)
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
