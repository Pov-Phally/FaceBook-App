import 'package:get/get.dart';

import '../../view/Menu/menu_screen.dart';
import '../../view/home/home_screen.dart';
class NavigationController extends GetxController{
  static NavigationController get to => Get.find();
  final selectedIndex = 0.obs;
  //if login is false go to login screen
  final isLogin = false.obs;
  //if login is true go to home screen

  final pages = [HomeScreen(), MenuScreen()];

}