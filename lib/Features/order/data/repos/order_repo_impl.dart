import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:foody/Features/order/data/data_sources/order_remote_data_source.dart';
import 'package:foody/Features/order/domain/entities/add_order_response_entity.dart';
import 'package:foody/Features/order/domain/entities/order_entity.dart';
import 'package:foody/Features/order/domain/repos/order_repo.dart';

import 'package:foody/core/errors/failure.dart';

class OrderRepoImpl extends OrderRepo {
  final OrderRemoteDataSource orderRemoteDataSource;

  OrderRepoImpl(this.orderRemoteDataSource);

  @override
  Future<Either<Failure, AddOrderResponseEntity>> addNewOrder(
      OrderEntity orderEntity) async {
    try {
      var result =
          await orderRemoteDataSource.addNewOrder(orderEntity: orderEntity);

      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
