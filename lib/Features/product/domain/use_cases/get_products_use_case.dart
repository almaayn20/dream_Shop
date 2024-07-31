import 'package:dartz/dartz.dart';
import 'package:foody/Features/product/domain/repos/product_repo.dart';
import 'package:foody/core/use_cases/use_case.dart';

import '../../../../core/errors/failure.dart';
import '../entities/product_entity.dart';

class GetProductsUseCase extends UseCase<List<ProductEntity>, NoParam> {
  final ProductRepo productRepo;

  GetProductsUseCase(this.productRepo);

  @override
  Future<Either<Failure, List<ProductEntity>>> call([NoParam? param]) async {
    return await productRepo.getProducts();
  }
}
