import 'package:foody/Features/settings/presentation/manger/settings_state.dart';
import 'package:get/get.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController(), fenix: true);
  }
}
