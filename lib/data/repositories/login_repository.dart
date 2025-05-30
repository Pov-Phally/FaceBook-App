import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:social_media/common/Handel%20Error/Validator/validator.dart';

import '../../model/login_model.dart';
import '../../service/api_service.dart';

class LoginRepository extends GetxController {
  final api = Get.put(ApiService());

  Future<Either<String, LoginModel>> login({
    required email,
    required password,
  }) async {
    try {
      final response = await api.dio.get(
        ApiService.loginApi,
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final loginModel = LoginModel.fromJson(response.data);
        return Right(loginModel);
      } else if (response.statusCode == 422) {
        return Left(parseErrors(response.data['errors']));
      } else {
        return Left("Failed to login - ${parseErrors(response.data)}");
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Left("Failed to login - ${parseErrors(e.response?.data)}");
    }
  }
}