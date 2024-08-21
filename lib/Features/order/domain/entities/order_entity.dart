import 'package:foody/Features/order/domain/entities/order_product_entity.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderEntity {
  final int userID;
  final String orderDate;
  final List<OrderProductEntity> orderProducts;
  final LatLng? geolocation;
  final String? paymentMethod;
  OrderEntity(
      {required this.userID,
      required this.orderDate,
      required this.orderProducts,
      this.geolocation,
      this.paymentMethod});
}
