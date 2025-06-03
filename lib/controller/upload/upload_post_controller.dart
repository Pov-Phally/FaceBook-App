import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media/common/widget/Message/alert.dart';
import 'package:social_media/controller/Authentication/login_controller.dart';
import 'package:social_media/data/repositories/create_post_repository.dart';

class UploadPostController extends GetxController {
  final fileImage = File('').obs;
  final CreatePostRepository createPostRepository = Get.put(
    CreatePostRepository(),
  );
  final LoginController loginRepository = Get.put(LoginController());
  final TextEditingController contentController = TextEditingController();

  Future<void> pickImage() async {
    try {
      final ImagePicker pickImage = ImagePicker();
      final XFile? image = await pickImage.pickImage(
        source: ImageSource.gallery,
      );
      final File file = File(image!.path);
      if (image.path.isNotEmpty) {
        fileImage.value = file;
      } else {
        return;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // Function to clear the selected image
  void clearImage() {
    fileImage.value = File('');
  }

  void createPost() async {
    final response = await createPostRepository.createPost(
      contentController.text.trim(),
      fileImage.value.path.isNotEmpty ? fileImage.value : null,
      loginRepository.storage.read('token'),
    );
    response.fold(
      (error) {
        if (kDebugMode) {
          print("Error creating post: $error");
        }
      },
      (successMessage) {
        if (kDebugMode) {
          print(successMessage);
          Get.back();
          AlertWidget.show(
            context: Get.context!,
            title: "Success",
            message: successMessage,
            showCancelButton: false,
            showConfirmButton: false,
            duration: const Duration(seconds: 1),
          );
        }
        clearImage(); // Clear the image after successful post creation
        contentController.clear(); // Clear the content field
      },
    );
  }
}