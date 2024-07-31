import 'package:foody/Features/product/domain/entities/product_entity.dart';
import 'package:foody/core/constants/constants.dart';
import 'package:hive/hive.dart';

abstract class ProductLocalDataSource {
  List<ProductEntity> getProducts();
}

class ProductLocalDataSourceImpl extends ProductLocalDataSource {
  @override
  List<ProductEntity> getProducts() {
    var products = Hive.box<ProductEntity>(kProductsBox);
    return products.values.toList();
  }
}
