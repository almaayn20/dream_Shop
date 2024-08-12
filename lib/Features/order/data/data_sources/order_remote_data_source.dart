import 'package:foody/Features/order/data/models/order_model/order_model.dart';
import 'package:foody/Features/order/domain/entities/order_entity.dart';

import '../../../../core/api_routes.dart';
import '../../../../core/hive_boxes/auth_box.dart';
import '../../../../core/utils/api_service.dart';

abstract class OrderRemoteDataSource {
  Future<void> addNewOrder({required OrderEntity orderEntity});
}

class OrderRemoteDataSourceImpl extends OrderRemoteDataSource {
  final ApiService apiService;

  OrderRemoteDataSourceImpl(this.apiService);

  @override
  Future<void> addNewOrder({required OrderEntity orderEntity}) async {
    await apiService.post(endPoint: ApiConstants.addNewOrders, data: {
      "uidAddress": orderEntity.addressUid,
      "typePayment": orderEntity.paymentType,
      "total": orderEntity.totalPrice,
      "products": orderEntity.orderProducts
    });
  }
}
