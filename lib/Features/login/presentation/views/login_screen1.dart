import 'package:flutter/material.dart';
import 'package:foody/Features/login/presentation/manger/login_controller.dart';
import 'package:foody/Features/login/presentation/views/login_content.dart';
import 'package:foody/core/widgets/indicator.dart';
import 'package:get/get.dart';

class SignInScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    //  Size size = MediaQuery.of(context).size;

    return Obx(
      () => WrapperIndicator(
        loading: controller.isLoading.value,
        child: GestureDetector(
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
