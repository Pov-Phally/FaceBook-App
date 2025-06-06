import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:either_dart/either.dart';
import 'package:get/get.dart';

import '../../service/api_service.dart';

class CreatePostRepository extends GetxController {
  final api = Get.put(ApiService());

  Future<Either<String, String>> createPost(
     String content,
  File? image,
     String token,
  ) async {
    try {
      // Create FormData with the file and content
      final formData = dio.FormData.fromMap({
        'content': content,
        if (image != null)
          'image': await dio.MultipartFile.fromFile(
            image.path,
            filename: image.path.split('/').last, // Add filename
          ),
      });

      // Send the POST request
      final response = await api.dio.post(
        ApiService.createPostApi,
        data: formData,
        options: dio.Options(headers: {'Authorization': 'Bearer $token'}),
      );

      // Handle response
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right("Post created successfully");
      } else if (response.statusCode == 422) {
        return Left("Validation error - ${response.data['message']}");
      } else {
        return Left("Failed to create post - ${response.data['message']}");
      }
    } catch (e) {
      return Left("Error: $e");
    }
  }
}