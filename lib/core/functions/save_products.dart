import 'package:hive/hive.dart';

import '../../Features/product/domain/entities/product_entity.dart';

void saveProductsData(List<ProductEntity> products, String boxName) {
  var box = Hive.box<ProductEntity>(boxName);
  box.addAll(products);
}
