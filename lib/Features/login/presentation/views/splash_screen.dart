import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/hive_boxes/auth_box.dart';
import 'package:foody/screen_routes.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenRouteFunction(
      duration: 3000,
      splash: Image.asset(
        'assets/logo/splash_logo.png',
        height: 180,
      ),
      splashTransition: SplashTransition.scaleTransition, // Type of transition
      backgroundColor:
          AppColors.orange100, // Background color of the splash screen
      splashIconSize: 150,
      pageTransitionType:
          PageTransitionType.fade, //with that line commented there is no error

      screenRouteFunction: () {
        return Future.value(
          AuthBox.isUserLoggedIn()
              ? ScreensRoutes.homeScreen
              : ScreensRoutes.welcomeScreen,
        );
      },
    );
  }
}

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:foody/core/constants/colors.dart';
// import 'package:foody/core/hive_boxes/auth_box.dart';
// import 'package:foody/screen_routes.dart';
// import 'package:get/get.dart';

// class SplashScreen extends StatelessWidget {
//   final duration = const Duration(seconds: 3);

//   SplashScreen({Key? key}) : super(key: key) {
//     handleOnInitialize();
//   }

//   void handleOnInitialize() async {
//     Future.delayed(duration).then((_) {
//       AuthBox.isUserLoggedIn()
//           ? Get.offNamed(
//               ScreensRoutes.homeScreen) // return to  ScreensRoutes.homeScreen
//           : Get.offNamed(ScreensRoutes.welcomeScreen);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.orange100,
//       body: SafeArea(
//         child: Center(
//           child: Image.asset(
//             'assets/images/logo.png',
//             height: 180,
//           ),
//         ),
//       ),
//     );
//   }
// }
