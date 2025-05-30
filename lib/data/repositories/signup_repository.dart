import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../common/Handel Error/Validator/validator.dart';
import '../../service/api_service.dart';

class SignupRepository extends GetxController {
  final api = Get.put(ApiService());

  Future<Either<String, String>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.dio.post(
        ApiService.registerApi,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': password,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right("User registered successfully");
      } else if (response.statusCode == 422) {
        return Left(parseErrors(response.data["errors"]));
      } else {
        if (kDebugMode) {
          print(response.data);
        }
        return Left("Failed to register user - ${parseErrors(response.data)}");
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Left("Failed to register user - ${parseErrors(e.response?.data)}");
    }
  }
}