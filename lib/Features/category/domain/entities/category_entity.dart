import 'package:hive/hive.dart';
part 'category_entity.g.dart';

@HiveType(typeId: 3)
class CategoryEntity {
  @HiveField(0)
  final String categoryTitle;

  CategoryEntity({
    required this.categoryTitle,
  });
}
