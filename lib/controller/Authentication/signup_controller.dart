import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../common/widget/Message/alert.dart';
import '../../data/repositories/signup_repository.dart';

class SignupController extends GetxController {
  final SignupRepository signupRepository = Get.put(SignupRepository());
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final isLoading = false.obs;

  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    final response = await signupRepository.signup(
      name: name,
      email: email,
      password: password,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        if (kDebugMode) {
          print("Registration failed:");
        }
        AlertWidget.show(
          context: Get.context!,
          title: "Error",
          message: error,
          showCancelButton: false,
        );
      },
      (successMessage) {
        if (kDebugMode) {
          print(successMessage);
        }
        AlertWidget.show(
          context: Get.context!,
          title: "Success",
          message: successMessage,
          onConfirm: () {},
          showCancelButton: false,
        );
      },
    );
  }
}