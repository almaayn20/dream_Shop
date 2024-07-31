import 'package:flutter/material.dart';
import 'package:foody/localization/app_localization.dart';
import 'package:foody/screen_routes.dart';
import 'package:get/get.dart';

import '../../../../localization/local_controller.dart';
import '../manger/products_state.dart';

class ProductsScreen extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.products.tr),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.access_alarm),
            onPressed: () {
              Get.toNamed(ScreensRoutes.welcomeScreen);
              // AppLocallcontroller locallcontroller = Get.find();
              // locallcontroller.changeLanguage(
              //     locallcontroller.language.languageCode == 'ar' ? 'en' : 'ar');
            }),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        return Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.73,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 4),
              children: [
                ...List.generate(
                  controller.products.length,
                  (index) => Container(),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
