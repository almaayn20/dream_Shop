import 'package:foody/Features/login/login_binding.dart';
import 'package:foody/Features/login/presentation/views/login_screen.dart';
import 'package:foody/Features/login/presentation/views/welcome_page.dart';
import 'package:foody/Features/product/presentation/views/products_screen.dart';
import 'package:foody/Features/product/product_binding.dart';
import 'package:foody/screen_routes.dart';
import 'package:get/get.dart';

class ScreensList {
  static final screensList = <GetPage>[
    GetPage(
      name: ScreensRoutes.signInScreen,
      page: () => SignInScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: ScreensRoutes.productsScreen,
      page: () => ProductsScreen(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: ScreensRoutes.welcomeScreen,
      page: () => WelcomeScreen(),
      binding: ProductBinding(),
    ),
  ];
}
