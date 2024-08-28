import 'package:dio/src/response.dart';
import 'package:foody/Features/order/data/models/add_order_response_model/order_response_model.dart';
import 'package:foody/Features/order/domain/entities/add_order_response_entity.dart';
import 'package:foody/Features/order/domain/entities/order_entity.dart';

import '../../../../core/api_routes.dart';
import '../../../../core/utils/api_service.dart';

abstract class OrderRemoteDataSource {
  Future<OrderResponseEntity> addNewOrder({required OrderEntity orderEntity});
  Future<List<OrderResponseEntity>> getUserOrders({required int userId});
}

class OrderRemoteDataSourceImpl extends OrderRemoteDataSource {
  final ApiService apiService;

  OrderRemoteDataSourceImpl(this.apiService);

  @override
  Future<OrderResponseEntity> addNewOrder(
      {required OrderEntity orderEntity}) async {
    var response =
        await apiService.post(endPoint: ApiConstants.addNewOrders, data: {
      "userId": orderEntity.userID,
      "date": orderEntity.orderDate,
      "products": orderEntity.orderProducts
          .map((product) => {
                "productId": product.productID,
                "quantity": product.productQuantity,
              })
          .toList()
    });

    return _getOrderResponseEntity(response);
  }

  OrderResponseEntity _getOrderResponseEntity(Response response) {
    return OrderResponseModel.fromJson(response.data);
  }

  List<OrderResponseEntity> _getOrderResponseEntityList(
      List<dynamic> response) {
    List<OrderResponseEntity> orders = [];
    for (var element in response) {
      orders.add(OrderResponseModel.fromJson(element));
    }
    return orders;
  }

  @override
  Future<List<OrderResponseEntity>> getUserOrders({required int userId}) async {
    var response = await apiService.getList(
        endPoint: ApiConstants.getUserOrders(userId.toString()));
    return _getOrderResponseEntityList(response);
  }
}
