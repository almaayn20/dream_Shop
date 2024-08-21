import 'package:dio/src/response.dart';
import 'package:foody/Features/order/data/models/add_order_response_model/add_order_response_model.dart';
import 'package:foody/Features/order/domain/entities/add_order_response_entity.dart';
import 'package:foody/Features/order/domain/entities/order_entity.dart';

import '../../../../core/api_routes.dart';
import '../../../../core/utils/api_service.dart';

abstract class OrderRemoteDataSource {
  Future<AddOrderResponseEntity> addNewOrder(
      {required OrderEntity orderEntity});
}

class OrderRemoteDataSourceImpl extends OrderRemoteDataSource {
  final ApiService apiService;

  OrderRemoteDataSourceImpl(this.apiService);

  @override
  Future<AddOrderResponseEntity> addNewOrder(
      {required OrderEntity orderEntity}) async {
    var response =
        await apiService.post(endPoint: ApiConstants.addNewOrders, data: {
      "userId": orderEntity.userID,
      "date": orderEntity.orderDate,
      "products": orderEntity.orderProducts
    });

    return _getOrderResponseEntity(response);
  }

  AddOrderResponseEntity _getOrderResponseEntity(Response response) {
    return AddOrderResponseModel.fromJson(response.data);
  }
}
