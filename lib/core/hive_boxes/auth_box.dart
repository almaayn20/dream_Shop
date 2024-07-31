import 'package:hive/hive.dart';

import '../../Features/login/data/models/user_model/user_model.dart';
import '../../Features/login/domain/entities/user_entity.dart';

class AuthBox {
  static const authBox = "authBox";
  static const authToken = "authToken";
  static const currentUserData = "currentUserData";
  static const userLoggedIn = "userLoggedIn";

  static void setAuthToken(String token) {
    final authBox = Hive.box(AuthBox.authBox);
    authBox.put(AuthBox.authToken, token);
  }

  static String? getAuthToken() {
    final authBox = Hive.box(AuthBox.authBox);
    return authBox.get(AuthBox.authToken);
  }

  static void setUserLoggedIn(bool isUserLoggedIn) {
    final authBox = Hive.box(AuthBox.authBox);
    authBox.put(AuthBox.userLoggedIn, isUserLoggedIn);
  }

  static bool isUserLoggedIn() {
    final authBox = Hive.box(AuthBox.authBox);
    return authBox.get(AuthBox.userLoggedIn, defaultValue: false);
  }

  static void setCurrentUserData(UserEntity user) {
    final authBox = Hive.box(AuthBox.authBox);
    authBox.put(AuthBox.currentUserData, user);
  }

  static UserEntity getCurrentUserData(UserModel user) {
    final authBox = Hive.box(AuthBox.authBox);
    return authBox.get(AuthBox.currentUserData);
  }
}
