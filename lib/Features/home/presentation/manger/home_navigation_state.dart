import 'package:flutter/material.dart';
import 'package:foody/Features/home/presentation/views/home_screen.dart';
import 'package:foody/Features/home/data/models/home_navigation_model.dart';
import 'package:foody/Features/maps/presentation/views/location_selector_screen.dart';
import 'package:foody/Features/order/presentation/views/cart_screen.dart';
import 'package:foody/Features/order/presentation/views/user_orders.dart';
import 'package:foody/Features/settings/presentation/views/settings_screen.dart';
import 'package:foody/screen_routes.dart';
import 'package:get/get.dart';

class HomeNavigationController extends GetxController {
  GlobalKey<ScaffoldState> key = GlobalKey();
  final RxList<HomeNavigationModel> _pages = [
    HomeNavigationModel(
      icon: "assets/icons/home_tab.svg",
      page: HomeScreen(),
    ),
    HomeNavigationModel(icon: "assets/icons/cart_tab.svg", page: CartScreen()),
    HomeNavigationModel(
      icon: "assets/icons/my_order.svg",
      page: UserOrdersScreen(),
    ),
    HomeNavigationModel(
        icon: "assets/icons/setting.svg", page: SettingsScreen()),
  ].obs;

  final RxInt _selectedIndex = 0.obs;

  void onItemTapped(int index) {
    _selectedIndex(index);
  }

  RxList<HomeNavigationModel> get pages => _pages;
  int get selectedIndex => _selectedIndex.value;
}
