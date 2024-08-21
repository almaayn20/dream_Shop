import 'package:foody/Features/order/domain/entities/add_order_response_entity.dart';

import 'product.dart';

class AddOrderResponseModel extends AddOrderResponseEntity {
  int? id;
  int? userId;
  String? date;
  List<Product>? products;

  AddOrderResponseModel({this.id, this.userId, this.date, this.products})
      : super(
            orderId: id!,
            userID: userId!,
            orderDate: date!,
            orderProducts: products!);

  factory AddOrderResponseModel.fromJson(Map<String, dynamic> json) {
    return AddOrderResponseModel(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      date: json['date'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'date': date,
        'products': products?.map((e) => e.toJson()).toList(),
      };
}
