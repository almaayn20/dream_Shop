import 'package:hive/hive.dart';
part 'category_entity.g.dart';

@HiveType(typeId: 3)
class CategoryEntity {
  @HiveField(0)
  final int categoryId;
  @HiveField(1)
  final String categoryTitle;
  @HiveField(2)
  final String categoryDescription;

  CategoryEntity(
      {required this.categoryId,
      required this.categoryTitle,
      required this.categoryDescription});
}
