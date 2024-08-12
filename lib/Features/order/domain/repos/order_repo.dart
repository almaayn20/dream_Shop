import 'package:dartz/dartz.dart';
import 'package:foody/Features/order/domain/entities/order_entity.dart';
import 'package:foody/core/errors/failure.dart';

abstract class OrderRepo {
  Future<Either<Failure, void>> addNewOrder(OrderEntity orderEntity);
}
