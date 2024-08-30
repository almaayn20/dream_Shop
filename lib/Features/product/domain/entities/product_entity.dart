import 'package:hive/hive.dart';
part 'product_entity.g.dart';

@HiveType(typeId: 2)
class ProductEntity {
  @HiveField(0)
  final num productId;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String productImage;
  @HiveField(3)
  final num productPrice;
  @HiveField(4)
  final String productDescription;
  @HiveField(5)
  final String productCategoryId;
  @HiveField(6)
  final num productRate;
  @HiveField(7)
  final num productRateCount;
  @HiveField(8)
  bool? isFavorite;

  ProductEntity(
      {required this.productId,
      required this.name,
      required this.productImage,
      required this.productPrice,
      required this.productDescription,
      required this.productCategoryId,
      required this.productRate,
      required this.productRateCount,
      required this.isFavorite});
}
