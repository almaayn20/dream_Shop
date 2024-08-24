import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foody/Features/home/presentation/manger/home_navigation_state.dart';
import 'package:foody/Features/home/presentation/widgets/bottom_app_bar.dart';
import 'package:foody/Features/order/presentation/manger/add_new_order_state.dart';
import 'package:foody/core/constants/colors.dart';
import 'package:foody/core/constants/radius.dart';
import 'package:foody/core/constants/shadow.dart';
import 'package:foody/core/constants/spacing.dart';
import 'package:foody/Features/home/data/models/home_navigation_model.dart';
import 'package:foody/core/widgets/material.dart';
import 'package:get/get.dart';

class HomeNavigationScreen extends GetView<HomeNavigationController> {
  HomeNavigationScreen({Key? key}) : super(key: key);
  final AddNewOrderController addNewOrderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        bottomNavigationBar: BottomTabBar(
          pages: controller.pages,
          onItemTapped: controller.onItemTapped,
          selectedIndex: controller.selectedIndex,
          badgeText: addNewOrderController.orderProducts.length.toString(),
        ),
        backgroundColor: AppColors.white100,
        body: controller.pages[controller.selectedIndex].page,
      );
    });
  }
}
