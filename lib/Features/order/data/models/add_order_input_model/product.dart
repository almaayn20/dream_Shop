import 'package:foody/Features/order/domain/entities/order_product_entity.dart';

class Product extends OrderProductEntity {
  int? productId;
  int? quantity;

  Product({this.productId, this.quantity})
      : super(productID: productId!, productQuantity: quantity!);

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json['productId'] as int?,
        quantity: json['quantity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'quantity': quantity,
      };
}
