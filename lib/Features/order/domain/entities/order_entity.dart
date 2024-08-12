import 'package:foody/Features/order/domain/entities/order_product_entity.dart';
import 'package:hive/hive.dart';
part 'order_entity.g.dart';

@HiveType(typeId: 5)
class OrderEntity {
  @HiveField(0)
  final String addressUid;
  @HiveField(1)
  final String paymentType;
  @HiveField(2)
  final double totalPrice;
  @HiveField(3)
  final List<OrderProductEntity> orderProducts;

  OrderEntity(
      {required this.addressUid,
      required this.paymentType,
      required this.totalPrice,
      required this.orderProducts});
}
