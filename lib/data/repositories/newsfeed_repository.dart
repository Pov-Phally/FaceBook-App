import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:social_media/common/Handel%20Error/Validator/validator.dart';
import 'package:social_media/model/post_model.dart';
import 'package:social_media/service/api_service.dart';

class NewsFeedRepository extends GetxController {
  final api = Get.put(ApiService());

  Future<Either<String, PostModel>> fetchNewsFeed( {required String token}) async {
    try {
      final response = await api.dio.get(
        ApiService.newsFeedApi,
        options: Options(headers: {'Authorization': ' Bearer $token'},)
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        PostModel post = PostModel.fromJson(response.data);
        return Right(post);
      } else if (response.statusCode == 401) {
        return Left("Unauthorized access - Invalid token");
      } else {
        return Left(
          "Failed to fetch news feed - ${parseErrors(response.data)}",
        );
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Left(
        "Failed to fetch news feed - ${parseErrors(e.toString() as Map<String, dynamic>?)}",
      );
    }
  }
}