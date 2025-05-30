import 'package:get/get.dart';
import 'package:social_media/controller/Authentication/login_controller.dart';
import 'package:social_media/data/repositories/logout_repository.dart';
import 'package:social_media/view/Authentication/login.dart';
import 'package:social_media/common/widget/Message/alert.dart';

class LogoutController extends GetxController {
  final LogoutRepository logoutRepository = Get.put(LogoutRepository());
  final LoginController loginController = Get.put(LoginController());

  Future<void> logout() async {
    final response = await logoutRepository.logout(
      token: loginController.storage.read('token'),
    );
    if (response) {
      // Clear the token from storage
      loginController.storage.remove('token');
      loginController.isLogin.value = false;
      // Navigate to login
      Get.offAll(() => LoginScreen());
      AlertWidget.show(
        context: Get.context!,
        title: "Success",
        message: "Logout successful",
        showCancelButton: false,
      );
    } else {
      return AlertWidget.show(
        context: Get.context!,
        title: "Error",
        message: "Failed to logout. Please try again.",
        showCancelButton: false,
      );
    }
  }
}