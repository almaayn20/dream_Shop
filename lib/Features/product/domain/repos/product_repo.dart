import 'package:dartz/dartz.dart';
import 'package:foody/Features/product/domain/entities/product_entity.dart';
import 'package:foody/core/errors/failure.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProductsTopHome();
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
      String categoryId);
  Future<Either<Failure, Stream<List<ProductEntity>>>> getProductsBySearch(
      String searchWord);
}
