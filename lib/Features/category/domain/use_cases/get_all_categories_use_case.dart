import 'package:dartz/dartz.dart';
import 'package:foody/Features/category/domain/entities/category_entity.dart';
import 'package:foody/Features/category/domain/repos/category_repo.dart';
import 'package:foody/core/use_cases/use_case.dart';

import '../../../../core/errors/failure.dart';

class GetAllCategoriesUseCase extends UseCase<List<CategoryEntity>, NoParam> {
  final CategoryRepo categoryRepo;

  GetAllCategoriesUseCase(this.categoryRepo);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call([NoParam? NoParam]) async {
    return await categoryRepo.getAllCategories();
  }
}
