import 'package:foody/Features/order/domain/entities/add_order_response_entity.dart';
import 'package:foody/Features/order/domain/use_cases/get_user_orders_use_case.dart';
import 'package:get/get.dart';

class GetUserOrdersController extends GetxController {
  final GetUserOrdersUseCase getUserOrdersUseCase;

  GetUserOrdersController(this.getUserOrdersUseCase);

  var errorMessage = ''.obs;
  var isLoading = false.obs;
  var userOrders = <OrderResponseEntity>[].obs;
  @override
  void onInit() async {
    await getUserOrders(1);
    super.onInit();
  }

  Future<void> getUserOrders(int userId) async {
    isLoading.value = true;
    final result = await getUserOrdersUseCase.call(param: userId);

    result.fold((failure) {
      errorMessage.value = failure.message;
    }, (orders) {
      //    userOrders.assignAll(orders.reversed.toList());
      userOrders.assignAll(orders);
    });
    isLoading.value = false;
  }

  void addUserOrderToUi(OrderResponseEntity orderResponseEntity) {
    //  userOrders.insert(0, orderResponseEntity);
    userOrders.add(orderResponseEntity);
  }
}
