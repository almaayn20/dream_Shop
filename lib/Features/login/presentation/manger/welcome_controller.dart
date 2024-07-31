import 'package:get/get.dart';

class WelcomeController extends GetxController {
  final RxBool _loading = true.obs;

  get loading => _loading.value;

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 2));
    _updateLoading(false);
    super.onInit();
  }

  void _updateLoading(bool _value) {
    _loading(_value);
    update();
  }
}
