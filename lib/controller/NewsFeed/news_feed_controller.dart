import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:social_media/model/post_model.dart';

import '../../data/repositories/newsfeed_repository.dart';
import '../Authentication/login_controller.dart';

class NewsFeedController extends GetxController {
  final newsFeedRepository = Get.put(NewsFeedRepository());
  final LoginController loginController = Get.put(LoginController());
  final isLoading = false.obs;
  final newsFeed = PostModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchNewsFeed();
  }

  Future<void> fetchNewsFeed() async {
    isLoading.value = true;
    final token = loginController.storage.read('token');
    final result = await newsFeedRepository.fetchNewsFeed(token: '$token');
    result.fold(
      (error) {
        if (kDebugMode) {
          print("Error fetching news feed: $error");
        }
      },
      (data) {
        newsFeed.value = data;
        if (kDebugMode) {
          print("News feed fetched successfully: ${data.post?.length} posts");
        }
      },
    );
    isLoading.value = false;
  }
}