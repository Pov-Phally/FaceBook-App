import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:social_media/common/Handel%20Error/Validator/validator.dart';
import 'package:social_media/model/user_model.dart';
import 'package:social_media/service/api_service.dart';

class UserDetailRepository extends GetxController {
  final api = Get.put(ApiService());

  Future<Either<String, UserModel>> getUserDetail({
    required String token,
  }) async {
    try {
      final response = await api.dio.get(
        ApiService.userApi,
        options: Options(
          headers: {'Authorization': ' Bearer $token'},
          receiveTimeout: const Duration(seconds: 20),
          sendTimeout: const Duration(seconds: 20),
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        UserModel user = UserModel.fromJson(response.data);
        return Right(user);
      } else if (response.statusCode == 401) {
        return Left("Unauthorized access - Invalid token");
      } else {
        return Left(
          "Failed to fetch user details - ${parseErrors(response.data)}",
        );
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Left(
        "Failed to fetch user details - ${parseErrors(e.response?.data ?? e.message)}",
      );
    }
  }
}