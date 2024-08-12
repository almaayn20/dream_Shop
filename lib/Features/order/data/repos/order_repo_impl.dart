import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:foody/Features/order/data/data_sources/order_remote_data_source.dart';
import 'package:foody/Features/order/domain/entities/order_entity.dart';
import 'package:foody/Features/order/domain/repos/order_repo.dart';
import 'package:foody/Features/product/data/data_sources/product_local_data_source.dart';
import 'package:foody/Features/product/data/data_sources/product_remote_data_source.dart';
import 'package:foody/Features/product/domain/entities/product_entity.dart';
import 'package:foody/Features/product/domain/repos/product_repo.dart';
import 'package:foody/core/errors/failure.dart';

class OrderRepoImpl extends OrderRepo {
  final OrderRemoteDataSource orderRemoteDataSource;

  OrderRepoImpl(this.orderRemoteDataSource);

  @override
  Future<Either<Failure, void>> addNewOrder(OrderEntity orderEntity) async {
    try {
      await orderRemoteDataSource.addNewOrder(orderEntity: orderEntity);

      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
