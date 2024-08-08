import 'package:dartz/dartz.dart';
import 'package:foody/Features/category/domain/entities/category_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class CategoryRepo {
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
}
