import 'package:foody/Features/category/category_binding.dart';
import 'package:foody/Features/home/presentation/manger/home_navigation_state.dart';
import 'package:foody/Features/home/presentation/manger/home_state.dart';
import 'package:foody/Features/maps/maps_binding.dart';
import 'package:foody/Features/order/order_binding.dart';
import 'package:foody/Features/payment/payment_binding.dart';

import 'package:foody/Features/product/product_binding.dart';
import 'package:foody/Features/profile/profile_binding.dart';
import 'package:foody/Features/settings/settings_binding.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
//=============================== home ======================================
    CategoryBinding().dependencies();
    ProductBinding().dependencies();
    OrderBinding().dependencies();
    SettingsBinding().dependencies();
    OrderBinding().dependencies();

    Get.lazyPut(() => HomeNavigationController(), fenix: true);

    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
