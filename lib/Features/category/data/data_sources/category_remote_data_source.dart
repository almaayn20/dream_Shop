import 'package:foody/Features/category/data/models/category.dart';
import 'package:foody/Features/category/domain/entities/category_entity.dart';
import 'package:foody/Features/product/domain/entities/product_entity.dart';
import 'package:foody/core/constants/constants.dart';
import 'package:foody/core/api_routes.dart';
import 'package:foody/core/functions/save_products.dart';
import 'package:foody/core/utils/api_service.dart';

import 'package:dio/dio.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryEntity>> getAllCategories();
}

class CategoryRemoteDataSourceImpl extends CategoryRemoteDataSource {
  final ApiService apiService;

  CategoryRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<CategoryEntity>> getAllCategories() async {
    var data = await apiService.get(endPoint: ApiConstants.getAllCategories);
    List<CategoryEntity> categories = getsCategoriesList(data);
    return categories;
  }

  List<CategoryEntity> getsCategoriesList(Map<String, dynamic> data) {
    List<CategoryEntity> categories = [];
    for (var categoryMap in data['categories']) {
      categories.add(Category.fromJson(categoryMap));
    }
    return categories;
  }
}
