import 'package:dartz/dartz.dart';
import 'package:foody/Features/order/domain/entities/add_order_response_entity.dart';
import 'package:foody/Features/order/domain/entities/order_entity.dart';
import 'package:foody/Features/order/domain/repos/order_repo.dart';
import 'package:foody/core/use_cases/use_case.dart';

import '../../../../core/errors/failure.dart';

class GetUserOrdersUseCase extends UseCase3<List<OrderResponseEntity>, int> {
  final OrderRepo orderRepo;

  GetUserOrdersUseCase(this.orderRepo);

  @override
  Future<Either<Failure, List<OrderResponseEntity>>> call(
      {required int param}) {
    return orderRepo.getUserOrders(param);
  }
}
