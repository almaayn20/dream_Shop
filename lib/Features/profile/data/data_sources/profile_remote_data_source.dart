import 'package:dio/src/response.dart';
import 'package:foody/Features/order/data/data_sources/order_remote_data_source.dart';
import 'package:foody/Features/order/data/models/add_order_response_model/order_response_model.dart';
import 'package:foody/Features/order/domain/entities/add_order_response_entity.dart';
import 'package:foody/Features/order/domain/entities/order_entity.dart';
import 'package:foody/Features/profile/data/models/user/profile.dart';
import 'package:foody/Features/profile/domain/entities/profile_entity.dart';
import 'package:foody/core/constants/constants.dart';
import 'package:hive/hive.dart';

import '../../../../core/api_routes.dart';
import '../../../../core/utils/api_service.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileEntity> getUserProfile({required int userId});
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final ApiService apiService;

  ProfileRemoteDataSourceImpl(this.apiService);

  @override
  Future<ProfileEntity> getUserProfile({required int userId}) async {
    var response = await apiService.get(
        endPoint: ApiConstants.getUserProfile(userId.toString()));
    ProfileEntity profile = Profile.fromJson(response);
    saveProfileData(profile, kProfileBox);

    return profile;
  }

  void saveProfileData(ProfileEntity profile, String boxName) {
    var box = Hive.box<ProfileEntity>(boxName);
    box.add(profile);
  }
}
