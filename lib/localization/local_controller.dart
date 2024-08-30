import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../core/utils/app_print_class.dart';
import '../core/hive_boxes/settings_box.dart';

class AppLocallcontroller extends GetxController {
  late Locale language;

  @override
  void onInit() {
    super.onInit();
    String langCode = SettingsBox.getLanguage();
    language = langCode == 'sys'
        ? Get.deviceLocale ?? const Locale('ar')
        : Locale(langCode);
  }

  void changeLanguage(String langCode) {
    AppPrint.printData(":::::::::::Change language to :$langCode");
    language = langCode == 'sys'
        ? Get.deviceLocale ?? const Locale('ar')
        : Locale(langCode);

    SettingsBox.setLanguage(langCode);
    Get.updateLocale(language);
  }
}
