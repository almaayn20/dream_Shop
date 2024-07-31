import 'package:foody/Features/product/domain/entities/product_entity.dart';

class Product extends ProductEntity {
  num? id;
  String? nameProduct;
  String? description;
  num? price;
  int? status;
  String? picture;
  String? category;
  int? categoryId;

  Product({
    this.id,
    this.nameProduct,
    this.description,
    this.price,
    this.status,
    this.picture,
    this.category,
    this.categoryId,
  }) : super(
            productId: id!,
            name: nameProduct!,
            image: picture ?? 'noImage',
            productPrice: price!,
            productStatus: status!,
            productDescription: description ?? 'noDescription',
            productCategoryId: categoryId!);

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as num,
        nameProduct: json['nameProduct'] as String?,
        description: json['description'] as String?,
        price: json['price'] as num,
        status: json['status'] as int?,
        picture: json['picture'] as String?,
        category: json['category'] as String?,
        categoryId: json['category_id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nameProduct': nameProduct,
        'description': description,
        'price': price,
        'status': status,
        'picture': picture,
        'category': category,
        'category_id': categoryId,
      };
}
