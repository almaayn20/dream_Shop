import 'package:dartz/dartz.dart';
import 'package:foody/Features/product/domain/repos/product_repo.dart';
import 'package:foody/core/use_cases/use_case.dart';

import '../../../../core/errors/failure.dart';
import '../entities/product_entity.dart';

class GetProductsByCategoryUseCase
    extends UseCase3<List<ProductEntity>, String> {
  final ProductRepo productRepo;

  GetProductsByCategoryUseCase(this.productRepo);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(
      {required String param}) async {
    return await productRepo.getProductsByCategory(param);
  }
}
