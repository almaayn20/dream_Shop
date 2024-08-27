import 'package:foody/core/hive_boxes/auth_box.dart';
import 'package:foody/screen_routes.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  void logOut() {
    AuthBox.setUserLoggedIn(false);
    Get.offAllNamed(ScreensRoutes.welcomeScreen);
  }
}
