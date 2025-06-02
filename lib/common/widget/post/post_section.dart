import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/common/BaseUrl/base_url.dart';
import 'package:social_media/controller/User/user_detail_controller.dart';

import '../../../view/post/upload_post.dart';

class PostSection extends StatelessWidget {
  PostSection({super.key});

  final controller = Get.put(UserDetailController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
            baseUrl + controller.user.value.user!.profilePicture.toString(),
          ),
        ),
        Expanded(
          child: TextFormField(
            onTap: () {
              Get.to(
                () => UploadPost(),
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
}