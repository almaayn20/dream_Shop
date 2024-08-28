import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:foody/Features/order/data/data_sources/order_remote_data_source.dart';
import 'package:foody/Features/order/domain/entities/add_order_response_entity.dart';
import 'package:foody/Features/order/domain/entities/order_entity.dart';
import 'package:foody/Features/profile/data/data_sources/profile_local_data_source.dart';
import 'package:foody/Features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:foody/Features/profile/domain/entities/profile_entity.dart';
import 'package:foody/Features/profile/domain/repos/profile_repo.dart';

import 'package:foody/core/errors/failure.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;
  final ProfileLocalDataSource profileLocalDataSource;

  ProfileRepoImpl(this.profileRemoteDataSource, this.profileLocalDataSource);

  @override
  Future<Either<Failure, ProfileEntity>> getUserProfile(int userId) async {
    try {
      ProfileEntity? result;
      result = profileLocalDataSource.getProfile();
      if (result != null) {
        return Right(result);
      }
      result = await profileRemoteDataSource.getUserProfile(userId: userId);

      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
