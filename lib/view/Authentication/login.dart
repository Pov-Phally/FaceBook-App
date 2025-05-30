import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/view/Authentication/signup.dart';

import '../../common/Handel Error/Validator/validator.dart';
import '../../common/widget/Custom Button/custom_button.dart';
import '../../common/widget/Custom TextButton/custom_text_button.dart';
import '../../common/widget/Custom TextField/custom_text_field.dart';
import '../../controller/Authentication/login_controller.dart';
import '../../generated/assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final LoginController controller = Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.02),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Form(
                      key: controller.loginFormKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              Assets.imagesFacebookLogoLogin,
                            ),
                            radius: 30,
                          ),
                          SizedBox(height: screenHeight * 0.025),
                          CustomTF(
                            labelText: 'Email',
                            validator: validateEmail,
                            controller: controller.emailController,
                          ),
                          SizedBox(height: screenHeight * 0.025),
                          CustomTF(
                            labelText: 'Password',
                            validator: validatePassword,
                            controller: controller.passwordController,
                          ),
                          SizedBox(height: screenHeight * 0.025),
                          Obx(() {
                            return CustomButton(
                              text:
                                  controller.isLoading.value
                                      ? 'Logging...'
                                      : 'Login',
                              onPressed: () {
                                if (controller.loginFormKey.currentState!
                                    .validate()) {
                                  controller.login();
                                }
                              },
                            );
                          }),
                          CustomTextButton(
                            text: 'Forget Password?',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.025),
                  child: CustomButton(
                    text: 'Create new account',
                    onPressed: () {
                      Get.to(() => SignupScreen());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}