import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../data/repositories/user_detail_repository.dart';
import '../../model/user_model.dart';
import '../Authentication/login_controller.dart';

class UserDetailController extends GetxController {
  final userDetailRepository = Get.put(UserDetailRepository());
  final LoginController loginController = Get.put(LoginController());
  var user = UserModel().obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }

  void getUserDetails() async {
    isLoading.value = true;
    try {
      final token = loginController.storage.read('token');
      final result = await userDetailRepository.getUserDetail(token: token);
      return result.fold(
        (error) {
          if (kDebugMode) {
            print("Error fetching user details: $error");
          }
          isLoading.value = false;
        },
        (userModel) {
          user.value = userModel;
          if (kDebugMode) {
            print("User details fetched successfully");
          }
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoading.value = false;
    }
  }
}