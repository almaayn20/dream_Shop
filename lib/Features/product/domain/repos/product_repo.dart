import 'package:dartz/dartz.dart';
import 'package:foody/Features/product/domain/entities/product_entity.dart';
import 'package:foody/core/errors/failure.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
