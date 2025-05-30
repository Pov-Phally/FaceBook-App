import 'package:flutter/material.dart';
import 'package:social_media/common/widget/Custom%20Button/custom_button.dart';
import 'package:social_media/controller/Authentication/logout_controller.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final LogoutController controller = Get.put(LogoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: CustomButton(
          text: "Logout",
          onPressed: () {
            controller.logout();
          },
        ),
      ),
    );
  }
}