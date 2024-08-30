import 'package:foody/Features/product/domain/entities/product_entity.dart';

import 'rating.dart';

class Product extends ProductEntity {
  num? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  }) : super(
            productId: id!,
            name: title!,
            productImage: image!,
            productPrice: price!,
            productDescription: description!,
            productCategoryId: category!,
            productRate: rating!.rate!,
            productRateCount: rating.count!,
            isFavorite: false);

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as num?,
        title: json['title'] as String?,
        price: json['price'] as num?,
        description: json['description'] as String?,
        category: json['category'] as String?,
        image: json['image'] as String?,
        rating: json['rating'] == null
            ? null
            : Rating.fromJson(json['rating'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'category': category,
        'image': image,
        'rating': rating?.toJson(),
      };
}
