import 'package:flutter/material.dart';
import 'package:foody/Features/home/presentation/views/home_screen.dart';
import 'package:foody/Features/home/data/models/home_navigation_model.dart';
import 'package:get/get.dart';

class HomeNavigationController extends GetxController {
  GlobalKey<ScaffoldState> key = GlobalKey();
  final RxList<HomeNavigationModel> _pages = [
    HomeNavigationModel(
      icon: "assets/icons/home_tab.svg",
      page: HomeScreen(),
    ),
    HomeNavigationModel(
      icon: "assets/icons/location_tab.svg",
      page: Container(),
    ),
    HomeNavigationModel(
      icon: "assets/icons/cart_tab.svg",
      page: Container(),
    ),
    HomeNavigationModel(
      icon: "assets/icons/favourite_tab.svg",
      page: Container(),
    ),
    HomeNavigationModel(
      icon: "assets/icons/notification_tab.svg",
      page: Container(),
    ),
  ].obs;

  final RxInt _selectedIndex = 0.obs;

  void onItemTapped(int index) {
    _selectedIndex(index);
  }

  RxList<HomeNavigationModel> get pages => _pages;
  int get selectedIndex => _selectedIndex.value;
}
