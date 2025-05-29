import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/common/widget/Custom%20Button/custom_button.dart';
import 'package:social_media/common/widget/Custom%20TextField/custom_text_field.dart';
import 'package:social_media/controller/Authentication/signup_controller.dart';
import 'package:social_media/common/Handel%20Error/Validator/validator.dart';
import 'package:social_media/generated/assets.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final controller = Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.02),
        child: SizedBox(
          height: screenHeight,
          child: SingleChildScrollView(
            child: Form(
              key: controller.registerFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.imagesFacebookLogoSignUp,
                    fit: BoxFit.cover,
                    height: 50,
                    width: 200,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Create a new account',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'It\'s quick and easy.',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  CustomTF(
                    labelText: 'Username',
                    controller: controller.usernameController,
                    validator: validateUsername,
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  CustomTF(
                    labelText: 'Email',
                    controller: controller.emailController,
                    validator: validateEmail,
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  CustomTF(
                    labelText: 'Password',
                    controller: controller.passwordController,
                    validator: validatePassword,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'By clicking Sign Up, you agree to our ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Terms',
                          style: TextStyle(color: Colors.blue),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  // Handle Terms tap
                                },
                        ),
                        TextSpan(
                          text: ', Data Policy and Cookie Policy.',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Obx(() {
                    return CustomButton(
                      text:
                          controller.isLoading.value
                              ? 'Signing Up...'
                              : 'Sign Up',
                      onPressed: () {
                        if (controller.registerFormKey.currentState!
                            .validate()) {
                          controller.signup(
                            name: controller.usernameController.text.trim(),
                            email: controller.emailController.text.trim(),
                            password: controller.passwordController.text.trim(),
                          );
                        }
                      },
                    );
                  }),
                  SizedBox(height: screenHeight * 0.025),
                  //already have an account
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Log In',
                          style: TextStyle(color: Colors.blue),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
                                },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}