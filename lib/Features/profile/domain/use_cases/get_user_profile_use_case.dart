import 'package:dartz/dartz.dart';
import 'package:foody/Features/order/domain/entities/add_order_response_entity.dart';
import 'package:foody/Features/order/domain/entities/order_entity.dart';
import 'package:foody/Features/order/domain/repos/order_repo.dart';
import 'package:foody/Features/profile/domain/entities/profile_entity.dart';
import 'package:foody/Features/profile/domain/repos/profile_repo.dart';
import 'package:foody/core/use_cases/use_case.dart';

import '../../../../core/errors/failure.dart';

class GetUserProfileUseCase extends UseCase3<ProfileEntity, int> {
  final ProfileRepo profileRepo;

  GetUserProfileUseCase(this.profileRepo);

  @override
  Future<Either<Failure, ProfileEntity>> call({required int param}) {
    return profileRepo.getUserProfile(param);
  }
}
