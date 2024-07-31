import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foody/Features/login/login_binding.dart';
import 'package:foody/Features/login/presentation/manger/login_controller.dart';
import 'package:get/get.dart';

import '../../../../core/constants/ghaps.dart';
import '../../../../core/helper/validations.dart';
import '../../../../core/widgets/snack_bar.dart';
import '../../../../localization/app_localization.dart';
import '../../../../screen_routes.dart';

class SignInScreen extends GetView<LoginController> {
  SignInScreen({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: 296,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// EMAIL TEXT FIELD
                      TextFormField(
                        controller: email,
                        validator: Validations.emailValidator,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Your email',
                        ),
                      ),
                      gapH16,

                      /// PASSWORD TEXT FIELD
                      TextFormField(
                        controller: password,
                        validator: Validations.passwordValidator,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                        ),
                      ),
                      gapH16,

                      /// SIGN IN BUTTON
                      SizedBox(
                        width: 296,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await controller.login(email.text, password.text);
                              controller.authenticated.value == true
                                  ? Get.toNamed(ScreensRoutes.productsScreen)
                                  : snackBarCustom(context,
                                      controller.errorMessage.value, '', () {});
                            }
                          },
                          child: Text(AppLocalization.login),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
