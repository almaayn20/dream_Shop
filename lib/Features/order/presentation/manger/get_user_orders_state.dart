import 'package:foody/Features/order/domain/entities/add_order_response_entity.dart';
import 'package:foody/Features/order/domain/use_cases/get_user_orders_use_case.dart';
import 'package:foody/Features/profile/presentation/manger/get_user_profile_state.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetUserOrdersController extends GetxController {
  final GetUserOrdersUseCase getUserOrdersUseCase;

  GetUserOrdersController(this.getUserOrdersUseCase);

  var errorMessage = ''.obs;
  var isLoading = false.obs;
  var userOrders = <OrderResponseEntity>[].obs;
  final GetUserProfileController profileController = Get.find();

  @override
  void onInit() async {
    await getUserOrders(profileController.profileEntity.value!.userId!);
    super.onInit();
  }

  List<OrderResponseEntity> addLocationToList(
      List<OrderResponseEntity> ordersToBeChanged) {
    var ordersWithLocation = <OrderResponseEntity>[];
    for (int i = 0; i < ordersToBeChanged.length; i++) {
      ordersWithLocation.add(OrderResponseEntity(
        orderId: ordersToBeChanged[i].orderId,
        orderDate: ordersToBeChanged[i].orderDate,
        orderStatus: ordersToBeChanged[i].orderStatus,
        userID: ordersToBeChanged[i].userID,
        orderProducts: ordersToBeChanged[i].orderProducts,
        paymentMethod: ordersToBeChanged[i].paymentMethod,
        geolocation: LatLng(
            double.parse(
                profileController.profileEntity.value!.userAddress!.lat!),
            double.parse(
                profileController.profileEntity.value!.userAddress!.lng!)),
      ));
    }
    return ordersWithLocation;
  }

  Future<void> getUserOrders(int userId) async {
    isLoading.value = true;
    final result = await getUserOrdersUseCase.call(param: userId);

    result.fold((failure) {
      errorMessage.value = failure.message;
    }, (orders) {
      //    userOrders.assignAll(orders.reversed.toList());
      userOrders.assignAll(addLocationToList(orders));
    });
    isLoading.value = false;
  }

  void addUserOrderToUi(OrderResponseEntity orderResponseEntity) {
    //  userOrders.insert(0, orderResponseEntity);
    userOrders.add(orderResponseEntity);
  }
}
