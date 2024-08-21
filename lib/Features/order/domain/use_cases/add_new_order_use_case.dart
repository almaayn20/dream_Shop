import 'package:dartz/dartz.dart';
import 'package:foody/Features/order/domain/entities/add_order_response_entity.dart';
import 'package:foody/Features/order/domain/entities/order_entity.dart';
import 'package:foody/Features/order/domain/repos/order_repo.dart';
import 'package:foody/core/use_cases/use_case.dart';

import '../../../../core/errors/failure.dart';

class AddNewOrderUseCase extends UseCase3<AddOrderResponseEntity, OrderEntity> {
  final OrderRepo orderRepo;

  AddNewOrderUseCase(this.orderRepo);

  @override
  Future<Either<Failure, AddOrderResponseEntity>> call(
      {required OrderEntity param}) {
    return orderRepo.addNewOrder(param);
  }
}
