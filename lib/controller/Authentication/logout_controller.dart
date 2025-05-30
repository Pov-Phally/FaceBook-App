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
      AlertWidget.show(
        context: Get.context!,
        title: "Logout",
        message: "Are you sure you want to logout?",
        onConfirm: () {
          Get.offAll(() => LoginScreen());
          Future.delayed(const Duration(milliseconds: 100), () {
            AlertWidget.show(
              context: Get.context!,
              title: "Success",
              message: "You have successfully logged out.",
              showCancelButton: false,
              showConfirmButton: false,
              duration: const Duration(seconds: 2),
            );
          });
        },
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