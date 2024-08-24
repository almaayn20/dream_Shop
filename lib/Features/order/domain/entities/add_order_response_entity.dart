import 'package:foody/Features/order/domain/entities/order_product_entity.dart';

class OrderResponseEntity {
  final int orderId;
  final int userID;
  final String orderDate;
  final List<OrderProductEntity> orderProducts;

  OrderResponseEntity(
      {required this.orderId,
      required this.userID,
      required this.orderDate,
      required this.orderProducts});
}
