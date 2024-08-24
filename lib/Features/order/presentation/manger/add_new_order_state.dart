import 'package:foody/Features/order/domain/entities/order_entity.dart';
import 'package:foody/Features/order/domain/entities/order_product_entity.dart';
import 'package:foody/Features/order/domain/use_cases/add_new_order_use_case.dart';
import 'package:foody/Features/order/domain/use_cases/get_user_orders_use_case.dart';
import 'package:foody/Features/order/presentation/manger/get_user_orders_state.dart';
import 'package:foody/Features/product/domain/entities/product_entity.dart';
import 'package:foody/Features/product/presentation/manger/products_by_category_state.dart';
import 'package:foody/Features/product/presentation/manger/products_by_title_state.dart';
import 'package:foody/Features/product/presentation/manger/products_top_home_state.dart';
import 'package:get/get.dart';

class AddNewOrderController extends GetxController {
  final AddNewOrderUseCase addNewOrderUseCase;

  AddNewOrderController(this.addNewOrderUseCase);

  var errorMessage = ''.obs;
  var isLoading = false.obs;
  var orderProducts = <OrderProductEntity>[].obs;
  GetUserOrdersController getUserOrdersUseCaseController = Get.find();

  double getTotalPrice() {
    double totalPrice = 0;

    for (var element in orderProducts) {
      totalPrice += element.productPrice! * element.productQuantity;
    }
    return totalPrice;
  }

  void doIncrease(int productId) {
    OrderProductEntity old = orderProducts[productId];
    OrderProductEntity productAfterUpdateQuantity = OrderProductEntity(
      productID: old.productID,
      productQuantity: old.productQuantity + 1,
      productPrice: old.productPrice,
    );
    orderProducts[productId] = productAfterUpdateQuantity;
  }

  void doDecrease(int productId) {
    if (orderProducts[productId].productQuantity - 1 > 0) {
      OrderProductEntity old = orderProducts[productId];
      OrderProductEntity productAfterUpdateQuantity = OrderProductEntity(
        productID: old.productID,
        productQuantity: old.productQuantity - 1,
        productPrice: old.productPrice,
      );
      orderProducts[productId] = productAfterUpdateQuantity;
    }
  }

  void deleteOrderProduct(int productId) {
    orderProducts.removeAt(productId);
  }

  void addProductPricesToList() {
    for (int i = 0; i < orderProducts.length; i++) {
      orderProducts[i] = OrderProductEntity(
        productID: orderProducts[i].productID,
        productQuantity: orderProducts[i].productQuantity,
        productPrice: getProductFromController(orderProducts[i].productID)
            .productPrice
            .toDouble(),
      );
    }
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
        (product) => product.productID == orderProductEntity.productID);

    if (isExist != -1) {
      // Create a new instance with updated quantity
      final updatedProduct = OrderProductEntity(
        productID: orderProducts[isExist].productID,
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
    }, (s) {
      getUserOrdersUseCaseController.getUserOrders(1);
    });
    isLoading.value = false;
  }
}
