import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysshop/screens/home/home_screen_controller.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  HomeScreenController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              ProfilePic(),
              SizedBox(height: 20),
              ProfileMenu(
                text: "My Account",
                icon: "assets/icons/User Icon.svg",
                press: () => {},
              ),
              ProfileMenu(
                text: "Notifications",
                icon: "assets/icons/Bell.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Settings",
                icon: "assets/icons/Settings.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Help Center",
                icon: "assets/icons/Question mark.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Log Out",
                icon: "assets/icons/Log out.svg",
                press: () {},
              ),
            ],
          ),
        ),
        Positioned(
          top: 12,
          left: 16,
          child: GestureDetector(
            child: Icon(
              Icons.arrow_back_sharp,
            ),
            onTap: () {
              controller.setCustomBottomBarItem(CustomBottomItemName.home);
            },
          ),
        )
      ],
    );
  }
}
