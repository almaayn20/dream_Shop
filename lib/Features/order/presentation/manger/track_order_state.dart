import 'package:foody/Features/order/domain/entities/add_order_response_entity.dart';
import 'package:foody/core/constants/constants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TrackOrderController extends GetxController {
  final OrderResponseEntity order;

  TrackOrderController() : order = Get.arguments as OrderResponseEntity;
  // Get the current status index
  int getCurrentStatusIndex() {
    OrderStatusEnum index = (order.orderId == 1 || order.orderId == 2)
        ? OrderStatusEnum.delivered
        : order.orderStatus!;
    return OrderStatusEnum.values.indexOf(index);
  }

  // Convert string orderDate to DateTime
  DateTime get orderDateTime => DateTime.parse(order.orderDate);

  String get formattedOrderDate {
    return DateFormat('yyyy-MM-dd HH:mm').format(orderDateTime);
  }
}
