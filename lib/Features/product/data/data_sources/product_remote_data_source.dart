import 'dart:async';

import 'package:foody/Features/product/domain/entities/product_entity.dart';
import 'package:foody/core/constants/constants.dart';
import 'package:foody/core/api_routes.dart';
import 'package:foody/core/functions/save_products.dart';
import 'package:foody/core/utils/api_service.dart';
import 'package:foody/core/utils/de_bouncer.dart';

import '../models/product.list.dart';
import 'package:dio/dio.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductEntity>> getProductsTopHome();
  Future<List<ProductEntity>> getProductsByCategory(int categoryId);
  Future<Stream<List<ProductEntity>>> getProductsByTitle(String searchWord);
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final ApiService apiService;

  final debouncer = DeBouncer(duration: Duration(milliseconds: 800));
  final StreamController<List<ProductEntity>> streamController =
      StreamController<List<ProductEntity>>.broadcast();

  void dispose() {
    streamController.close();
  }

  ProductRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<ProductEntity>> getProductsTopHome() async {
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

  @override
  Future<List<ProductEntity>> getProductsByCategory(int categoryId) async {
    var data = await apiService.get(
        endPoint:
            ApiConstants.searchPorductsForCategory(categoryId.toString()));
    List<ProductEntity> products = getsProductsList(data);
    return products;
  }

  @override
  Future<Stream<List<ProductEntity>>> getProductsByTitle(
      String searchWord) async {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      var data = await apiService.get(
          endPoint: ApiConstants.searchProductsForName(searchWord));
      List<ProductEntity> products = getsProductsList(data);
      streamController.add(products);
    };

    final timer = Timer(
        const Duration(milliseconds: 200), () => debouncer.value = searchWord);
    Future.delayed(const Duration(milliseconds: 400))
        .then((_) => timer.cancel());
    return streamController.stream;
  }
}
