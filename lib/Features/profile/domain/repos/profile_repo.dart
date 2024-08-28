import 'package:dartz/dartz.dart';
import 'package:foody/Features/profile/domain/entities/profile_entity.dart';
import 'package:foody/core/errors/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileEntity>> getUserProfile(int userId);
}
