import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysshop/components/coustom_bottom_nav_bar.dart';

import 'package:mysshop/screens/home/home_screen_controller.dart';
import 'package:mysshop/screens/profile/profile_screen.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenController controller = Get.put(HomeScreenController());
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => getBodyScreen(controller.bottomBarItem.value),
            ),
          ),
          Obx(
            () => getBottomScreen(controller.bottomBarItem.value),
          ),
        ],
      ),
    );
  }

  Widget getBodyScreen(CustomBottomItemName item) {
    switch (item) {
      case CustomBottomItemName.home:
        return Body();
      case CustomBottomItemName.profile:
        return ProfileScreen();
    }
  }

  Widget getBottomScreen(CustomBottomItemName item) {
    switch (item) {
      case CustomBottomItemName.home:
        return CustomBottomNavBar(
          homeScreenController: controller,
        );
      case CustomBottomItemName.profile:
        return SizedBox();
    }
  }
}
