import 'package:get/state_manager.dart';

class ProductDetailsController extends GetxController {
  final RxInt _quantity = 1.obs;

  int get quantity => _quantity.value;

  void doIncrease() {
    _quantity(_quantity.value + 1);
  }

  void doDecrease() {
    if (_quantity.value - 1 > 0) {
      _quantity(_quantity.value - 1);
    }
  }
}
