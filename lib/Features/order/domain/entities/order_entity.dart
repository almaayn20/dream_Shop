import 'package:foody/Features/order/domain/entities/order_product_entity.dart';
import 'package:foody/core/constants/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderEntity {
  final int userID;
  final String orderDate;
  final List<OrderProductEntity> orderProducts;
  final LatLng? geolocation;
  final String? paymentMethod;
  final OrderStatusEnum? orderStatus;
  OrderEntity(
      {required this.userID,
      required this.orderDate,
      required this.orderProducts,
      this.geolocation,
      this.paymentMethod,
      this.orderStatus});
}
