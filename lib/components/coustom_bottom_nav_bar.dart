import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mysshop/screens/home/home_screen_controller.dart';

import '../constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  final HomeScreenController homeScreenController;

  CustomBottomNavBar({required this.homeScreenController});

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      height: 55 + MediaQuery.of(context).padding.bottom,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Obx(
              () => SvgPicture.asset(
                "assets/icons/Shop Icon.svg",
                width: 30,
                height: 30,
                color: homeScreenController.bottomBarItem.value ==
                        CustomBottomItemName.home
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
            ),
            onPressed: () {
              homeScreenController
                  .setCustomBottomBarItem(CustomBottomItemName.home);
              print('home tab onpress');
            },
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/Heart Icon.svg",
              width: 30,
              height: 30,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/Chat bubble Icon.svg",
              width: 30,
              height: 30,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Obx(
              () => SvgPicture.asset(
                "assets/icons/User Icon.svg",
                width: 30,
                height: 30,
                color: homeScreenController.bottomBarItem.value ==
                        CustomBottomItemName.profile
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
            ),
            onPressed: () => homeScreenController
                .setCustomBottomBarItem(CustomBottomItemName.profile),
          ),
        ],
      ),
    );
  }
}
