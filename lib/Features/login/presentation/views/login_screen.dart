import 'package:flutter/material.dart';
import 'package:foody/Features/login/presentation/manger/login_controller.dart';
import 'package:foody/Features/login/presentation/views/login_content.dart';
import 'package:foody/core/widgets/indicator.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  Size size = MediaQuery.of(context).size;

    return Obx(
      () => WrapperIndicator(
        loading: controller.isLoading.value,
        child: GestureDetector(
          onPanDown: (_) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: SingleChildScrollView(
              child: LoginContent(controller: controller),
            ),
          ),
        ),
      ),
    );
  }
}
