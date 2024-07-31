import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SettingsBox {
  static const boxKey = "appSettings";
  static const languageKey = "appLanguage";

  static void setLanguage(String lang) {
    final settingBox = Hive.box(SettingsBox.boxKey);
    settingBox.put(SettingsBox.languageKey, lang);
  }

  static String getLanguage() {
    final settingBox = Hive.box(SettingsBox.boxKey);
    return settingBox.get(SettingsBox.languageKey, defaultValue: 'sys');
  }
}
