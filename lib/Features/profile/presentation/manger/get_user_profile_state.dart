import 'package:foody/Features/order/domain/entities/add_order_response_entity.dart';
import 'package:foody/Features/profile/domain/entities/profile_entity.dart';
import 'package:foody/Features/profile/domain/use_cases/get_user_profile_use_case.dart';
import 'package:get/get.dart';

class GetUserProfileController extends GetxController {
  final GetUserProfileUseCase getUserProfileUseCase;

  GetUserProfileController(this.getUserProfileUseCase);

  var errorMessage = ''.obs;
  var isLoading = false.obs;
  Rx<ProfileEntity?> profileEntity = Rx<ProfileEntity?>(null);
  @override
  void onInit() async {
    await getUserProfile(1);
    super.onInit();
  }

  Future<void> getUserProfile(int userId) async {
    isLoading.value = true;
    final result = await getUserProfileUseCase.call(param: userId);

    result.fold((failure) {
      errorMessage.value = failure.message;
    }, (profile) {
      profileEntity.value = profile;
      print(profileEntity.value!.userEmail!);
    });
    isLoading.value = false;
  }
}
