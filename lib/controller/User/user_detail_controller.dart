import 'package:get/get.dart';

import '../../data/repositories/user_detail_repository.dart';
import '../../model/user_model.dart';
import '../Authentication/login_controller.dart';

class UserDetailController extends GetxController {
  final userDetailRepository = Get.put(UserDetailRepository());
  final LoginController loginController = Get.put(LoginController());
  var user = UserModel().obs;

  @override
  void onInit() {
    getUserDetails();
    super.onInit();
    // Initialize any necessary data or services here
  }

  void getUserDetails() async {
    final token = loginController.storage.read('token');
    final result = await userDetailRepository.getUserDetail(token: token);
    return result.fold(
      (error) {
        if (Get.isDialogOpen!) {
          Get.back();
        }
        Get.snackbar("Error", error, snackPosition: SnackPosition.BOTTOM);
      },
      (userData) {
        user.value = userData;
      },
    );
  }
}