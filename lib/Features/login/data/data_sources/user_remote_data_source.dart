import '../../../../core/api_routes.dart';
import '../../../../core/hive_boxes/auth_box.dart';
import '../../../../core/utils/api_service.dart';
import '../../domain/entities/user_entity.dart';
import '../models/user_model/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserEntity> login({required String email, required String password});
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final ApiService apiService;

  UserRemoteDataSourceImpl(this.apiService);

  @override
  Future<UserEntity> login(
      {required String email, required String password}) async {
    var response =
        await apiService.post(endPoint: ApiConstants.loginEmailId, data: {
      "email": email,
      "password": password,
    });

    UserEntity user = UserModel.fromJson(response.data);

    AuthBox.setAuthToken(user.userToken);
    AuthBox.setCurrentUserData(user);
    AuthBox.setUserLoggedIn(true);

    return user;
  }
}
