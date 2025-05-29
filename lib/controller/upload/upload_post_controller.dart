import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadPostController extends GetxController {
  static UploadPostController get to => Get.find();
  final fileImage = File('').obs;

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
}