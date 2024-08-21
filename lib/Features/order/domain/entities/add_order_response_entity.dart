import 'package:foody/Features/order/domain/entities/add_order_product_response_entity.dart';

class AddOrderResponseEntity {
  final int orderId;
  final int userID;
  final String orderDate;
  final List<AddOrderProductResponseEntity> orderProducts;

  AddOrderResponseEntity(
      {required this.orderId,
      required this.userID,
      required this.orderDate,
      required this.orderProducts});
}
