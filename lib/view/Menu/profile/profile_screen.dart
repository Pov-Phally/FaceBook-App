import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/common/widget/news%20feed/news_feed.dart';

import '../../../common/BaseUrl/base_url.dart';
import '../../../common/ShimmerEffect/shimmer_effect.dart';
import '../../../common/widget/Custom Button/custom_button.dart';
import '../../../common/widget/Post Section/post_section.dart';
import '../../../common/widget/Profile Page/cover_section.dart';
import '../../../common/widget/Profile Page/profile_section.dart';
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
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getUserDetails();
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              //Cover Section
              CoverSection(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              ),
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
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02,
                    ),
                    child: Text(
                      controller.user.value.user!.name.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02,
                    ),
                    child: CustomButton(
                      icon: Icons.edit,
                      text: 'Edit Profile',
                      color: Colors.grey,
                      onPressed: () {},
                    ),
                  ),
                  Divider(thickness: 2, color: Colors.grey),
                  // Bio Section
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Details',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('... See your info about'),
                        ),
                        CustomButton(
                          text: 'Edit public details',
                          color: Colors.blueAccent.shade100,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Post Section
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Posts',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Obx(() {
                          return postSection(controller);
                        }),
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey, thickness: 2),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.user.value.user!.posts?.length ?? 0,
                    itemBuilder: (context, index) {
                      final con = controller.user.value.user;
                      return NewsFeed(
                        profile: baseUrl + con!.profilePicture.toString(),
                        name: con.name.toString(),
                        time:
                            con.posts != null && con.posts!.isNotEmpty
                                ? con.posts![index].createdAtDuration
                                : '',
                        status:
                            con.posts != null && con.posts!.isNotEmpty
                                ? con.posts![index].content.toString()
                                : '',
                        likeCounts:
                            con.posts![index].likesCount != null &&
                                    con.posts![index].likesCount! > 0
                                ? con.posts![index].likesCount.toString()
                                : '',
                        commentCounts:
                            con.posts![index].commentsCount != null &&
                                    con.posts![index].commentsCount! > 0
                                ? " ${con.posts![index].commentsCount.toString()} Comments"
                                : '',
                        postImage:
                            con.posts![index].image != null &&
                                    con.posts!.isNotEmpty
                                ? Container(
                                  height: screenHeight * 0.25,
                                  width: screenWidth,
                                  color: Colors.black,
                                  child: Image.network(
                                    baseUrl +
                                        con.posts![index].image.toString(),
                                    fit: BoxFit.fill,
                                  ),
                                )
                                : ShimmerEffect(child: SizedBox.shrink()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}