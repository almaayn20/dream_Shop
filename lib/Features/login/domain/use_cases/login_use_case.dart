import 'package:dartz/dartz.dart';
import 'package:foody/Features/login/domain/repos/user_repo.dart';
import 'package:foody/core/use_cases/use_case.dart';

import '../../../../core/errors/failure.dart';
import '../entities/user_entity.dart';

class LoginUseCase extends UseCase2<String, String, String> {
  final UserRepo userRepo;

  LoginUseCase(this.userRepo);

  @override
  Future<Either<Failure, String>> call(
      {required String param, required String param2}) async {
    return await userRepo.login(email: param, password: param2);
  }
}
