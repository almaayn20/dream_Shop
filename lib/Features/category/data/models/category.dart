import 'package:foody/Features/category/domain/entities/category_entity.dart';

class Category extends CategoryEntity {
  int? id;
  String? category;
  String? description;

  Category({this.id, this.category, this.description})
      : super(
            categoryId: id!,
            categoryTitle: category!,
            categoryDescription: description!);

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        category: json['category'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'category': category,
        'description': description,
      };
}
