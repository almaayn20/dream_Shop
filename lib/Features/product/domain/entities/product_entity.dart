import 'package:hive/hive.dart';
part 'product_entity.g.dart';

@HiveType(typeId: 2)
class ProductEntity {
  @HiveField(0)
  final num productId;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final num productPrice;
  @HiveField(4)
  final int productStatus;
  @HiveField(5)
  final String productDescription;
  @HiveField(6)
  final int productCategoryId;

  ProductEntity({
    required this.productId,
    required this.name,
    required this.image,
    required this.productPrice,
    required this.productStatus,
    required this.productDescription,
    required this.productCategoryId,
  });
}
