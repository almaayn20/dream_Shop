import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:foody/Features/category/data/data_sources/category_remote_data_source.dart';
import 'package:foody/Features/category/domain/entities/category_entity.dart';
import 'package:foody/Features/category/domain/repos/category_repo.dart';
import 'package:foody/Features/product/data/data_sources/product_local_data_source.dart';
import 'package:foody/Features/product/data/data_sources/product_remote_data_source.dart';
import 'package:foody/Features/product/domain/entities/product_entity.dart';
import 'package:foody/core/errors/failure.dart';

class CategoryRepoImpl extends CategoryRepo {
  final CategoryRemoteDataSource categoryRemoteDataSource;

  CategoryRepoImpl(this.categoryRemoteDataSource);

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    try {
      List<CategoryEntity> categoryList;

      categoryList = await categoryRemoteDataSource.getAllCategories();

      return Right(categoryList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
