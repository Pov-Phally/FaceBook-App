import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/common/widget/news%20feed/news_feed.dart';

import '../../../common/BaseUrl/base_url.dart';
import '../../../common/widget/Profile Page/cover_section.dart';
import '../../../common/widget/Profile Page/profile_section.dart';
import '../../../common/widget/post/post_section.dart';
import '../../../controller/User/user_detail_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(UserDetailController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            //Cover Section
            CoverSection(screenHeight: screenHeight, screenWidth: screenWidth),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.18),
                // Profile Section
                ProfileSection(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  image:
                      baseUrl +
                      controller.user.value.user!.profilePicture.toString(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                  child: Text(
                    controller.user.value.user!.name.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(thickness: 3, color: Colors.grey),
                // Post Section
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: PostSection(),
                ),
                Divider(thickness: 3, color: Colors.grey),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.user.value.user!.posts?.length ?? 0,
                  itemBuilder: (context, index) {
                    return NewsFeed(
                      profile:
                          baseUrl +
                          controller.user.value.user!.profilePicture.toString(),
                      name: controller.user.value.user!.name.toString(),
                      time: '2h ago',
                      status:
                          controller.user.value.user!.posts != null &&
                                  controller.user.value.user!.posts!.isNotEmpty
                              ? controller
                                  .user
                                  .value
                                  .user!
                                  .posts![index]
                                  .content
                                  .toString()
                              : '',
                      likeCounts:
                          controller
                                          .user
                                          .value
                                          .user!
                                          .posts![index]
                                          .likesCount !=
                                      null &&
                                  controller.user.value.user!.posts!.isNotEmpty
                              ? controller
                                  .user
                                  .value
                                  .user!
                                  .posts![index]
                                  .likesCount
                                  .toString()
                              : '0',
                      commentCounts:
                          controller.user.value.user!.posts != null
                              ? controller
                                  .user
                                  .value
                                  .user!
                                  .posts![index]
                                  .commentsCount
                                  .toString()
                              : '0',
                      postImage:
                          controller.user.value.user!.posts![index].image !=
                                      null &&
                                  controller.user.value.user!.posts!.isNotEmpty
                              ? SizedBox(
                                height: screenHeight * 0.25,
                                width: screenWidth,
                                child: Image.network(
                                  baseUrl +
                                      controller
                                          .user
                                          .value
                                          .user!
                                          .posts![index]
                                          .image
                                          .toString(),
                                  fit: BoxFit.cover,
                                ),
                              )
                              : SizedBox.shrink(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}