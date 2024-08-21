import 'package:foody/Features/order/domain/entities/order_entity.dart';

import 'product.dart';

class AddOrderInputModel extends OrderEntity {
  int? userId;
  String? date;
  List<Product>? products;

  AddOrderInputModel({this.userId, this.date, this.products})
      : super(userID: userId!, orderDate: date!, orderProducts: products!);

  factory AddOrderInputModel.fromJson(Map<String, dynamic> json) {
    return AddOrderInputModel(
      userId: json['userId'] as int?,
      date: json['date'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'date': date,
        'products': products?.map((e) => e.toJson()).toList(),
      };
}
