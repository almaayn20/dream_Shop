import 'package:dartz/dartz.dart';
import 'package:foody/Features/order/domain/entities/add_order_response_entity.dart';
import 'package:foody/Features/order/domain/entities/order_entity.dart';
import 'package:foody/core/errors/failure.dart';

abstract class OrderRepo {
  Future<Either<Failure, OrderResponseEntity>> addNewOrder(
      OrderEntity orderEntity);
  Future<Either<Failure, List<OrderResponseEntity>>> getUserOrders(int userId);
}
