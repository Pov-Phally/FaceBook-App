import 'package:flutter/material.dart';
import 'package:social_media/common/widget/Custom%20Button/custom_button.dart';
import 'package:social_media/controller/Authentication/logout_controller.dart';
import 'package:get/get.dart';
import 'package:social_media/view/Menu/profile/profile_screen.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});
  final LogoutController controller = Get.put(LogoutController());
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              // Navigate to edit profile screen
              Get.to(
                () => ProfileScreen(),
                preventDuplicates: true,
                fullscreenDialog: true,
                transition: Transition.rightToLeft,
                duration: Duration(milliseconds: 400),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: screenHeight * 0.02),
              height: screenHeight * 0.07,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(screenHeight * 0.02),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.01),
                child: Row(
                  spacing: screenHeight * 0.01,
                  children: [
                    CircleAvatar(
                      radius: screenHeight * 0.025,
                      backgroundColor: Colors.red,
                    ),
                    Text(
                      'User Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(screenHeight * 0.02),
            child: CustomButton(text: 'Logout', onPressed: controller.logout),
          ),
        ],
      ),
    );
  }
}