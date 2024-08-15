import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:foody/Features/product/data/data_sources/product_local_data_source.dart';
import 'package:foody/Features/product/data/data_sources/product_remote_data_source.dart';
import 'package:foody/Features/product/domain/entities/product_entity.dart';
import 'package:foody/Features/product/domain/repos/product_repo.dart';
import 'package:foody/core/errors/failure.dart';

class ProductRepoImpl extends ProductRepo {
  final ProductLocalDataSource productLocalDataSource;
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepoImpl(this.productLocalDataSource, this.productRemoteDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsTopHome() async {
    try {
      List<ProductEntity> productList;
      // productList = productLocalDataSource.getProducts();
      // if (productList.isNotEmpty) {
      //   return Right(productList);
      // }
      productList = await productRemoteDataSource.getProductsTopHome();

      return Right(productList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
      String categoryId) async {
    try {
      List<ProductEntity> productList;

      productList =
          await productRemoteDataSource.getProductsByCategory(categoryId);

      return Right(productList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Stream<List<ProductEntity>>>> getProductsBySearch(
      String searchWord) async {
    try {
      Stream<List<ProductEntity>> productList;

      productList =
          await productRemoteDataSource.getProductsByTitle(searchWord);

      return Right(productList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
