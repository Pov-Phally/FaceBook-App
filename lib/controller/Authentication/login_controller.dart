import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  void login() {}

  void navigateToSignup() {
    Get.toNamed('/signup');
  }

  void navigateToForgotPassword() {
    Get.toNamed('/forgot-password');
  }
}