import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio(
    BaseOptions(
      baseUrl: "http://10.0.2.2:8001",
      followRedirects: true,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      validateStatus: (status) {
        return status != null && status < 500; // Accepts 302 as valid
      },
    ),
  );
  static const String loginApi = "/api/login";
  static const String registerApi = "/api/register";
  static const String userApi = "/api/user";
  static const String postApi = "/api/post";
  static const String commentApi = "/api/comment";
  static const String likeApi = "/api/like";
  static const String logoutApi = "/api/logout";
}