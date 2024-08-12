import 'package:hive/hive.dart';
part 'order_product_entity.g.dart';

@HiveType(typeId: 4)
class OrderProductEntity {
  @HiveField(0)
  final int productUid;
  @HiveField(1)
  final int productQuantity;
  @HiveField(2)
  final double productPrice;

  OrderProductEntity(
      {required this.productUid,
      required this.productQuantity,
      required this.productPrice});
}
