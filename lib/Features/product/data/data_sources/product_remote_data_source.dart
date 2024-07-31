import 'package:foody/Features/product/domain/entities/product_entity.dart';
import 'package:foody/core/constants/constants.dart';
import 'package:foody/core/api_routes.dart';
import 'package:foody/core/functions/save_products.dart';
import 'package:foody/core/utils/api_service.dart';

import '../models/product.list.dart';
import 'package:dio/dio.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductEntity>> getProducts();
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final ApiService apiService;

  ProductRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<ProductEntity>> getProducts() async {
    var data = await apiService.get(endPoint: ApiConstants.listProductsAdmin);
    List<ProductEntity> products = getsProductsList(data);

    saveProductsData(products, kProductsBox);

    return products;
  }

  List<ProductEntity> getsProductsList(Map<String, dynamic> data) {
    List<ProductEntity> products = [];
    for (var productMap in data['productsdb']) {
      products.add(Product.fromJson(productMap));
    }
    return products;
  }
}
