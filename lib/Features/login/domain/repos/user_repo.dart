import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class UserRepo {
  Future<Either<Failure, String>> login(
      {required String email, required String password});
}
