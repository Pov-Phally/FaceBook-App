import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view/post/upload_post.dart';

class PostSection extends StatelessWidget {
  const PostSection({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 20, backgroundImage: NetworkImage(imageUrl)),
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