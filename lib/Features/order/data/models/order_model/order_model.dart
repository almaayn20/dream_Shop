import 'package:foody/Features/order/data/models/order_model/order_product.dart';
import 'package:foody/Features/order/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  String? uidAddress;
  double? total;
  String? typePayment;
  List<OrderProduct>? products;

  OrderModel({
    this.uidAddress,
    this.total,
    this.typePayment,
    this.products,
  }) : super(
            addressUid: uidAddress!,
            paymentType: typePayment!,
            totalPrice: total!,
            orderProducts: products!);

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        uidAddress: json['uidAddress'] as String?,
        total: (json['total'] as num?)?.toDouble(),
        typePayment: json['typePayment'] as String?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => OrderProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'uidAddress': uidAddress,
        'total': total,
        'typePayment': typePayment,
        'products': products?.map((e) => e.toJson()).toList(),
      };
}
