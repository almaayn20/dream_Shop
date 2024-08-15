import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/hive_boxes/auth_box.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repos/user_repo.dart';
import '../data_sources/user_remote_data_source.dart';

class UserRepoImpl extends UserRepo {
  final UserRemoteDataSource userRemoteDataSource;
  UserRepoImpl(
    this.userRemoteDataSource,
  );

  @override
  Future<Either<Failure, String>> login(
      {required String email, required String password}) async {
    try {
      final user =
          await userRemoteDataSource.login(email: email, password: password);

      return Right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
