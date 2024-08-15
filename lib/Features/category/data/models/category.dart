import 'package:foody/Features/category/domain/entities/category_entity.dart';

class Category extends CategoryEntity {
  final String name;

  Category({required this.name}) : super(categoryTitle: name);

  factory Category.fromJson(String json) {
    return Category(name: json);
  }

  String toJson() {
    return name;
  }
}
