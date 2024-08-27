import 'package:foody/Features/category/category_binding.dart';
import 'package:foody/Features/category/presentation/views/categories_view.dart';
import 'package:foody/Features/home/home_binding.dart';
import 'package:foody/Features/home/presentation/manger/home_state.dart';
import 'package:foody/Features/home/presentation/views/home_navigation.dart';
import 'package:foody/Features/home/presentation/views/home_screen.dart';
import 'package:foody/Features/login/login_binding.dart';
import 'package:foody/Features/login/presentation/views/login_screen.dart';
import 'package:foody/Features/login/presentation/views/login_screen.dart';
import 'package:foody/Features/login/presentation/views/welcome_page.dart';
import 'package:foody/Features/maps/maps_binding.dart';
import 'package:foody/Features/maps/presentation/manger/location_selector_state.dart';
import 'package:foody/Features/order/order_binding.dart';
import 'package:foody/Features/order/presentation/views/track_order.dart';
import 'package:foody/Features/order/presentation/views/user_orders.dart';
import 'package:foody/Features/product/presentation/manger/products_base_state.dart';
import 'package:foody/Features/product/presentation/views/products_screen.dart';
import 'package:foody/Features/product/product_binding.dart';
import 'package:foody/Features/settings/presentation/views/settings_screen.dart';
import 'package:foody/Features/settings/settings_binding.dart';
import 'package:foody/screen_routes.dart';
import 'package:get/get.dart';

class ScreensList {
  static final screensList = <GetPage>[
    GetPage(
      name: ScreensRoutes.loginScreen,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: ScreensRoutes.welcomeScreen,
      page: () => WelcomeScreen(),
      binding: ProductBinding(),
    ),
    // GetPage(
    //   name: ScreensRoutes.categoriesScreen,
    //   page: () => CategoriesScreen(),
    //   binding: CategoryBinding(),
    // ),
    GetPage(
      name: ScreensRoutes.homeScreen,
      page: () => HomeNavigationScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: ScreensRoutes.locationSelectorScreen,
      page: () => HomeNavigationScreen(),
      binding: MapsBinding(),
    ),
    GetPage(
      name: ScreensRoutes.cartScreen,
      page: () => HomeNavigationScreen(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: ScreensRoutes.userOrdersScreen,
      page: () => UserOrdersScreen(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: ScreensRoutes.trackOrderScreen,
      page: () => TrackOrderScreen(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: ScreensRoutes.settingsScreen,
      page: () => SettingsScreen(),
      binding: SettingsBinding(),
    ),
  ];
}
