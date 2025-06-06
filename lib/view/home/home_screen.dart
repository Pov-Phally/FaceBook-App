import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/BaseUrl/base_url.dart';
import '../../common/ShimmerEffect/shimmer_effect.dart';
import '../../common/widget/Post Section/post_section.dart';
import '../../common/widget/news feed/news_feed.dart';
import '../../controller/NewsFeed/news_feed_controller.dart';
import '../../controller/User/user_detail_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final String defaultProfileImage =
      "https://www.pngarts.com/files/10/Default-Profile-Picture-Free-PNG-Image.png";

  final double screenHeight = Get.height;
  final double screenWidth = Get.width;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserDetailController());
    final postController = Get.put(NewsFeedController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Facebook",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await postController.fetchNewsFeed();
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 0,
                ),
                child: Obx(() {
                  return postSection(controller);
                }),
              ),
              Divider(thickness: 3, color: Colors.grey),
              Obx(() {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: postController.newsFeed.value.post?.length ?? 0,
                  itemBuilder: (context, index) {
                    final post = postController.newsFeed.value.post;
                    return NewsFeed(
                      profile:
                          baseUrl +
                          post![index].user!.profilePicture.toString(),
                      name: post[index].user!.name ?? "",
                      time: post[index].createdAtDuration,
                      postImage:
                          post[index].image != null &&
                                  post[index].image!.isNotEmpty
                              ? Container(
                                height: screenHeight * 0.25,
                                width: screenWidth,
                                color: Colors.black,
                                child: Image.network(
                                  baseUrl + post[index].image.toString(),
                                  fit: BoxFit.fill,
                                ),
                              )
                              : ShimmerEffect(child: SizedBox.shrink()),
                      status: post[index].content ?? "",
                      likeCounts:
                          post[index].likesCount != null &&
                                  post[index].likesCount! > 0
                              ? post[index].likesCount!.toString()
                              : '',
                      commentCounts:
                          post[index].commentsCount != null &&
                                  post[index].commentsCount! > 0
                              ? "${post[index].commentsCount!.toString()} Comments"
                              : '',
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}