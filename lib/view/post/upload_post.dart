import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/upload/upload_post_controller.dart';

class UploadPost extends StatelessWidget {
  UploadPost({super.key});
  final uploadPostController = Get.put(UploadPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create post"),
        centerTitle: true,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 60,
            height: 35,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                'Post',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
                        ),
                      ),
                      Text(
                        'Meng Lyy',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      uploadPostController.pickImage();
                    },
                    icon: Icon(Icons.photo),
                  ),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.3,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      mouseCursor: SystemMouseCursors.text,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'What\'s on your mind?',
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Obx(
              () =>
                  uploadPostController.fileImage.value.path.isNotEmpty
                      ? Stack(
                        children: [
                          SizedBox(
                            height: 300,
                            width: double.infinity,
                            child: Image.file(
                              File(uploadPostController.fileImage.value.path),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            top: 5,
                            right: 10,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  uploadPostController.clearImage();
                                },
                                icon: Icon(Icons.clear, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                      : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}