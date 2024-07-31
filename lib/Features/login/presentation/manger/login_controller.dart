import 'package:foody/Features/login/login_binding.dart';
import 'package:get/get.dart';

import '../../../../core/hive_boxes/auth_box.dart';
import '../../domain/use_cases/login_use_case.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;

  LoginController(this.loginUseCase);

  var token = ''.obs;
  var errorMessage = ''.obs;
  var isLoading = false.obs;
  var user = ''.obs;
  var authenticated = false.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    final result = await loginUseCase.call(param: email, param2: password);

    result.fold((failure) {
      errorMessage.value = failure.message;
    }, (auth) {
      user.value = auth.firstName;
      AuthBox.setUserLoggedIn;
      authenticated.value = true;
    });
    isLoading.value = false;
  }
}
