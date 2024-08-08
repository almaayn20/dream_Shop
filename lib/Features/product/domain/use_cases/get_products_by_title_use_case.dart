import 'package:dartz/dartz.dart';
import 'package:foody/Features/product/domain/repos/product_repo.dart';
import 'package:foody/core/use_cases/use_case.dart';

import '../../../../core/errors/failure.dart';
import '../entities/product_entity.dart';

class GetProductsByTitleUseCase
    extends UseCase3<Stream<List<ProductEntity>>, String> {
  final ProductRepo productRepo;

  GetProductsByTitleUseCase(this.productRepo);

  @override
  Future<Either<Failure, Stream<List<ProductEntity>>>> call(
      {required String param}) async {
    return await productRepo.getProductsBySearch(param);
  }
}
