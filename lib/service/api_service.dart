import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio(
    BaseOptions(
      baseUrl: "http://10.0.2.2:8001",
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      followRedirects: true,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Connection': 'keep-alive',
        'Authorization': 'bearer',
      },
      validateStatus: (status) {
        return status != null && status < 500; // Accepts 302 as valid
      },
    ),
  );
  static const String loginApi = "/api/login";
  static const String registerApi = "/api/register";
  static const String userApi = "/api/user";
  static const String createPostApi = "/api/post/create";
  static const String newsFeedApi = "/api/posts";
  static const String commentApi = "/api/comment";
  static const String likeApi = "/api/like";
  static const String logoutApi = "/api/logout";
}