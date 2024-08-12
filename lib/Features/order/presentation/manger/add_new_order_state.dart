import 'package:foody/Features/login/login_binding.dart';
import 'package:foody/Features/order/data/models/order_model/order_product.dart';
import 'package:foody/Features/order/domain/entities/order_entity.dart';
import 'package:foody/Features/order/domain/entities/order_product_entity.dart';
import 'package:foody/Features/order/domain/use_cases/add_new_order_use_case.dart';
import 'package:foody/Features/product/domain/entities/product_entity.dart';
import 'package:foody/Features/product/presentation/manger/products_by_category_state.dart';
import 'package:foody/Features/product/presentation/manger/products_by_title_state.dart';
import 'package:foody/Features/product/presentation/manger/products_top_home_state.dart';
import 'package:foody/core/helper/app_print_class.dart';
import 'package:get/get.dart';

import '../../../../core/hive_boxes/auth_box.dart';

class AddNewOrderController extends GetxController {
  final AddNewOrderUseCase addNewOrderUseCase;

  AddNewOrderController(this.addNewOrderUseCase);

  var errorMessage = ''.obs;
  var isLoading = false.obs;
  var orderProducts = <OrderProductEntity>[].obs;

  double getTotalPrice() {
    double totalPrice = 0;
    for (var element in orderProducts) {
      totalPrice += element.productPrice * element.productQuantity;
    }
    return totalPrice;
  }

  void doIncrease(int productId) {
    AppPrint().printInfo(info: productId.toString());
    OrderProductEntity old = orderProducts[productId];
    OrderProductEntity productAfterUpdateQuantity = OrderProductEntity(
        productUid: old.productUid,
        productQuantity: old.productQuantity + 1,
        productPrice: old.productPrice);
    orderProducts[productId] = productAfterUpdateQuantity;
  }

  void doDecrease(int productId) {
    AppPrint().printInfo(info: productId.toString());
    if (orderProducts[productId].productQuantity - 1 > 0) {
      OrderProductEntity old = orderProducts[productId];
      OrderProductEntity productAfterUpdateQuantity = OrderProductEntity(
          productUid: old.productUid,
          productQuantity: old.productQuantity - 1,
          productPrice: old.productPrice);
      orderProducts[productId] = productAfterUpdateQuantity;
    }
  }

  void deleteOrderProduct(int productId) {
    orderProducts.removeAt(productId);
  }

  ProductEntity getProductFromController(int id) {
    final ProductsByCategoryController productsByCategoryController =
        Get.find();
    final TopHomeProductsController topHomeProductsController = Get.find();
    final ProductsByTitleController productsByTitleController = Get.find();

    int index = productsByCategoryController.products
        .indexWhere((element) => element.productId == id);
    if (index != -1) {
      return productsByCategoryController.products[index];
    }
    index = topHomeProductsController.products
        .indexWhere((element) => element.productId == id);
    if (index != -1) {
      return topHomeProductsController.products[index];
    }
    index = productsByTitleController.products
        .indexWhere((element) => element.productId == id);
    return productsByTitleController.products[index];
  }

  void addOrderProduct(OrderProductEntity orderProductEntity) {
    int isExist = orderProducts.indexWhere(
        (product) => product.productUid == orderProductEntity.productUid);

    if (isExist != -1) {
      // Create a new instance with updated quantity
      final updatedProduct = OrderProductEntity(
        productUid: orderProducts[isExist].productUid,
        productQuantity: orderProducts[isExist].productQuantity +
            orderProductEntity.productQuantity,
        productPrice: orderProductEntity.productPrice,
      );

      // Replace the old instance in the list
      orderProducts[isExist] = updatedProduct;
    } else {
      orderProducts.add(orderProductEntity);
    }
  }

  Future<void> addNewOrder(OrderEntity orderEntity) async {
    isLoading.value = true;
    final result = await addNewOrderUseCase.call(param: orderEntity);

    result.fold((failure) {
      errorMessage.value = failure.message;
    }, (auth) {});
    isLoading.value = false;
  }
}
