import 'package:foody/Features/profile/domain/entities/profile_entity.dart';
import 'package:foody/core/constants/constants.dart';
import 'package:hive/hive.dart';

abstract class ProfileLocalDataSource {
  ProfileEntity? getProfile();
}

class ProfileLocalDataSourceImpl extends ProfileLocalDataSource {
  @override
  ProfileEntity? getProfile() {
    var profile = Hive.box<ProfileEntity>(kProfileBox);

    return profile.isNotEmpty ? profile.get(0) : null;
  }
}
