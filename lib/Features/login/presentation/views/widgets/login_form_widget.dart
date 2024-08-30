import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/Features/login/presentation/manger/login_controller.dart';
import 'package:foody/core/utils/validations.dart';
import 'package:foody/core/widgets/form_label_field_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginFormWidget extends StatelessWidget {
  final TextEditingController emailController, passwordController;
  final LoginController controller;

  LoginFormWidget(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormLabelFieldWidget(
          hintText: 'Your Email',
          darkTheme: Get.isDarkMode,
          controller: emailController,
          validator: Validations.emptyValidator,
          label: 'E-mail',
        ),
        SizedBox(height: 20.0.h),
        Obx(
          () => FormLabelFieldWidget(
            hintText: 'Your Password',
            darkTheme: Get.isDarkMode,
            controller: passwordController,
            obscureText: controller.passwordVisible.value,
            showObscureToggle: true,
            onPressSufixobscureTextIcon: () {
              controller.passwordVisible.value =
                  !controller.passwordVisible.value;
            },
            textInputAction: TextInputAction.done,
            validator: Validations.passwordValidator,
            label: 'Password',
          ),
        ),
      ],
    );
  }
}
