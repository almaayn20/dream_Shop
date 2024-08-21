import 'package:dartz/dartz.dart';
import 'package:foody/Features/order/domain/entities/add_order_response_entity.dart';
import 'package:foody/Features/order/domain/entities/order_entity.dart';
import 'package:foody/core/errors/failure.dart';

abstract class OrderRepo {
  Future<Either<Failure, AddOrderResponseEntity>> addNewOrder(
      OrderEntity orderEntity);
}
