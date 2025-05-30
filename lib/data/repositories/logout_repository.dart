import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:social_media/common/Handel%20Error/Validator/validator.dart';
import 'package:social_media/service/api_service.dart';

class LogoutRepository extends GetxController {
  final api = Get.put(ApiService());

  Future<bool> logout({required String token}) async {
    final response = await api.dio.post(
      ApiService.logoutApi,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      if (response.statusCode == 401) {
        return false;
      } else {
        // Other errors
        throw Exception("Failed to logout - ${parseErrors(response.data)}");
      }
    }
  }
}