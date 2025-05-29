import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/navigation/navigation_controller.dart';

class Navigation extends StatelessWidget {
  Navigation({super.key});

  final navController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return NavigationBar(
          backgroundColor: Colors.white,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: navController.selectedIndex.value,
          onDestinationSelected: (index) =>
          navController.selectedIndex.value = index,
          destinations: [
            NavigationDestination(icon: Icon(Icons.home_filled), label: "Home"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          ],
        );
      }),
      body: Obx(() => navController.pages[navController.selectedIndex.value]),

    );
  }
}