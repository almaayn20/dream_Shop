import 'dart:convert';

import '../../../../core/api_routes.dart';
import '../../../../core/hive_boxes/auth_box.dart';
import '../../../../core/services/api_service.dart';
import '../../domain/entities/user_entity.dart';

abstract class UserRemoteDataSource {
  Future<String> login({required String email, required String password});
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final ApiService apiService;

  UserRemoteDataSourceImpl(this.apiService);

  @override
  Future<String> login(
      {required String email, required String password}) async {
    var response = await apiService.post(endPoint: ApiConstants.login, data: {
      "username": email,
      "password": password,
    });

    String token = response.data['token'];
    return token;
  }
}
