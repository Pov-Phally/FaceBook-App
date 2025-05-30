import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:social_media/view/navigation/navigation.dart';

import '../../common/widget/Message/alert.dart';
import '../../data/repositories/login_repository.dart';

class LoginController extends GetxController {
  final LoginRepository loginRepository = Get.put(LoginRepository());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  var isLogin = false.obs;
  final storage = GetStorage();
  @override
  void onReady() {
    if (kDebugMode) {
      print("LoginController initialized");
    }
    // Check if user is already logged in
    final token = storage.read('token');
    if (token != null) {
      isLogin.value = true;
      Get.offAll(() => Navigation());
    }
    super.onReady();
  }

  Future<void> login() async {
    isLoading.value = true;
    final response = await loginRepository.login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    isLoading.value = false;
    response.fold(
      (error) {
        if (kDebugMode) {
          print("Login failed: $error");
        }
        AlertWidget.show(
          context: Get.context!,
          title: "Error",
          message: error,
          showCancelButton: false,
        );
      },
      (loginModel) {
        if (kDebugMode) {
          print("Login successful: ${loginModel.token}");
        }
        storage.write('token', loginModel.token);
        AlertWidget.show(
          context: Get.context!,
          title: "Success",
          message: "Login successful",
          showCancelButton: false,
        );
        isLogin.value = true;
        Get.offAll(() => Navigation());
      },
    );
  }

  void navigateToSignup() {
    Get.toNamed('/signup');
  }

  void navigateToForgotPassword() {
    Get.toNamed('/forgot-password');
  }
}