import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:foody/Features/login/domain/entities/user_entity.dart';
import 'package:foody/Features/order/domain/entities/order_entity.dart';
import 'package:foody/Features/order/domain/entities/order_product_entity.dart';
import 'package:foody/Features/product/domain/entities/product_entity.dart';
import 'package:foody/Features/profile/domain/entities/geolocation_entity.dart';
import 'package:foody/Features/profile/domain/entities/profile_entity.dart';
import 'package:foody/core/constants/api_keys.dart';
import 'package:foody/core/constants/constants.dart';
import 'package:foody/core/hive_boxes/auth_box.dart';
import 'package:foody/core/hive_boxes/settings_box.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../localization/local_controller.dart';
import '../helper/app_print_class.dart';
import 'package:permission_handler/permission_handler.dart';

class AppServices extends GetxService {
  Future<AppServices> init() async {
    AppPrint.printInfo(":::::::::::::Initialize App services");

    Get.lazyPut(() => AppLocallcontroller());

    return this;
  }
}

Future<void> initialServices() async {
  await Get.putAsync(() => AppServices().init());
}

Future<void> initialHive() async {
  // Request storage permissions for Android and iOS
  await requestStoragePermissions();

  // Get the application documents directory
  String appDocPath = await GetApplicationDocumentsDirectory();
  Hive.init(appDocPath);

  Stripe.publishableKey = ApiKeys.publishableKey;

  // Register adapters
  registerHiveAdapters();

  // Open Hive boxes
  await openHiveBoxes();
}

void registerHiveAdapters() {
  Hive.registerAdapter(UserEntityAdapter());
  Hive.registerAdapter(ProductEntityAdapter());
  Hive.registerAdapter(ProfileEntityAdapter());
  Hive.registerAdapter(GeolocationEntityAdapter());
}

Future<void> openHiveBoxes() async {
  await Hive.openBox<ProductEntity>(kProductsBox);
  await Hive.openBox(SettingsBox.boxKey);
  await Hive.openBox<ProductEntity>(kProductsBox);
  await Hive.openBox(authBox);
  await Hive.openBox<ProfileEntity>(kProfileBox);
}

Future<String> GetApplicationDocumentsDirectory() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  return appDocPath;
}

Future<void> requestStoragePermissions() async {
  if (Platform.isAndroid || Platform.isIOS) {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }
}
