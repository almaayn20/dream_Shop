import 'package:foody/Features/order/domain/entities/order_product_entity.dart';

class OrderProduct extends OrderProductEntity {
  int? uidProduct;
  int? quantity;
  double? price;

  OrderProduct({this.uidProduct, this.quantity, this.price})
      : super(
            productUid: uidProduct!,
            productQuantity: quantity!,
            productPrice: price!);

  factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
        uidProduct: json['uidProduct'] as int?,
        quantity: json['quantity'] as int?,
        price: (json['price'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'uidProduct': uidProduct,
        'quantity': quantity,
        'price': price,
      };
}
