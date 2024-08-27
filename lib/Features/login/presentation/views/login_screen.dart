// import 'package:flutter/material.dart';
// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:foody/Features/login/presentation/manger/login_controller.dart';
// import 'package:foody/core/constants/colors.dart';
// import 'package:foody/core/constants/radius.dart';
// import 'package:foody/core/constants/shadow.dart';
// import 'package:foody/core/constants/spacing.dart';
// import 'package:foody/core/helper/validations.dart';
// import 'package:foody/core/hive_boxes/auth_box.dart';
// import 'package:foody/core/widgets/snack_bar.dart';
// import 'package:foody/localization/app_localization.dart';
// import 'package:foody/screen_routes.dart';
// import 'package:get/get.dart';

// class SignInScreen extends GetView<LoginController> {
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           child: Container(
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   height: 400.h,
//                   decoration: const BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage('assets/images/background.png'),
//                           fit: BoxFit.fill)),
//                   child: Stack(
//                     children: <Widget>[
//                       Positioned(
//                         left: 30,
//                         width: 80.w,
//                         height: 200.h,
//                         child: FadeInUp(
//                             duration: const Duration(seconds: 1),
//                             child: Container(
//                               decoration: const BoxDecoration(
//                                   image: DecorationImage(
//                                       image: AssetImage(
//                                           'assets/images/light-1.png'))),
//                             )),
//                       ),
//                       Positioned(
//                         left: 140,
//                         width: 80.w,
//                         height: 150.h,
//                         child: FadeInUp(
//                             duration: const Duration(milliseconds: 1200),
//                             child: Container(
//                               decoration: const BoxDecoration(
//                                   image: DecorationImage(
//                                       image: AssetImage(
//                                           'assets/images/light-2.png'))),
//                             )),
//                       ),
//                       Positioned(
//                         right: 40,
//                         top: 40,
//                         width: 80.w,
//                         height: 150.h,
//                         child: FadeInUp(
//                             duration: const Duration(milliseconds: 1300),
//                             child: Container(
//                               decoration: const BoxDecoration(
//                                   image: DecorationImage(
//                                       image: AssetImage(
//                                           'assets/images/clock.png'))),
//                             )),
//                       ),
//                       Positioned(
//                         child: FadeInUp(
//                             duration: const Duration(milliseconds: 1600),
//                             child: Container(
//                               margin: EdgeInsets.only(top: AppSpacing.space50),
//                               child: const Center(
//                                 child: Text(
//                                   "Login",
//                                   style: TextStyle(
//                                       color: AppColors.white100,
//                                       fontSize: 40,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             )),
//                       )
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(AppSpacing.space32),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       FadeInUp(
//                           duration: const Duration(milliseconds: 1800),
//                           child: Expanded(
//                             child: Container(
//                               padding: EdgeInsets.all(AppSpacing.space5),
//                               decoration: BoxDecoration(
//                                 color: AppColors.white100,
//                                 borderRadius:
//                                     BorderRadius.circular(AppRadius.border10),
//                                 boxShadow: AppShadow.buttonWhite,
//                               ),
//                               child: Form(
//                                 key: _formKey,
//                                 child: Column(
//                                   children: <Widget>[
//                                     Container(
//                                       padding:
//                                           EdgeInsets.all(AppSpacing.space8),
//                                       decoration: const BoxDecoration(
//                                           border: Border(
//                                               bottom: BorderSide(
//                                                   color: AppColors.orange100))),
//                                       child: TextFormField(
//                                         controller: email,
//                                         validator: Validations.emptyValidator,
//                                         keyboardType: TextInputType.text,
//                                         decoration: InputDecoration(
//                                           hintText: 'Your email',
//                                         ),
//                                       ),
//                                     ),
//                                     Container(
//                                       padding:
//                                           EdgeInsets.all(AppSpacing.space8),
//                                       child: TextFormField(
//                                         controller: password,
//                                         validator:
//                                             Validations.passwordValidator,
//                                         keyboardType:
//                                             TextInputType.visiblePassword,
//                                         obscureText: true,
//                                         decoration: InputDecoration(
//                                           hintText: 'Password',
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           )),
//                       SizedBox(
//                         height: 30.h,
//                       ),
//                       FadeInUp(
//                           duration: const Duration(milliseconds: 1900),
//                           child: Container(
//                             width: double.infinity,
//                             height: 50.h,
//                             child: ElevatedButton(
//                               onPressed: () async {
//                                 if (_formKey.currentState!.validate()) {
//                                   await controller.login(
//                                       email.text, password.text);
//                                   AuthBox.isUserLoggedIn() == true
//                                       ? Get.toNamed(ScreensRoutes.homeScreen)
//                                       : snackBarCustom(
//                                           context,
//                                           controller.errorMessage.value,
//                                           '',
//                                           () {});
//                                 }
//                               },
//                               child: Text(AppLocalization.login.tr),
//                             ),
//                           )),
//                       SizedBox(
//                         height: 70.h,
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }
