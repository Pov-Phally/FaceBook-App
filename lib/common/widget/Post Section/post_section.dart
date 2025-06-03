import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../controller/User/user_detail_controller.dart';
import '../../../view/post/upload_post.dart';
import '../../BaseUrl/base_url.dart';

Row postSection(UserDetailController controller) {
  return Row(
    children: [
      controller.user.value.user != null
          ? CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              baseUrl + controller.user.value.user!.profilePicture.toString(),
            ),
          )
          : Shimmer(
            duration: Duration(seconds: 2),
            interval: Duration(seconds: 1),
            color: Colors.white,
            colorOpacity: 0.5,
            enabled: true,
            direction: ShimmerDirection.fromLTRB(),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade300,
            ),
          ),
      Expanded(
        child: TextFormField(
          onTap: () {
            Get.to(
              () => UploadPost(
                profile: baseUrl +controller.user.value.user!.profilePicture.toString(),
                name: controller.user.value.user!.name.toString(),
              ),
              fullscreenDialog: true,
              transition: Transition.downToUp,
              duration: Duration(milliseconds: 400),
              preventDuplicates: true,
            );
          },
          mouseCursor: SystemMouseCursors.none,
          showCursor: false,
          decoration: InputDecoration(
            hintText: 'What\'s on your mind?',
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ),
      IconButton(onPressed: () {}, icon: Icon(Icons.photo)),
    ],
  );
}