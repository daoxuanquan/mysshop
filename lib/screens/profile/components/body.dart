import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysshop/screens/cart/components/check_out_card.dart';
import 'package:mysshop/screens/home/home_screen_controller.dart';
import 'package:mysshop/screens/payment/index.dart';

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
                text: "Thêm credit card",
                icon: "assets/icons/Cash.svg",
                press: () => {Get.to(() => PaymentScreen())},
              ),
              ProfileMenu(
                text: "Thông báo",
                icon: "assets/icons/Bell.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Cài đặt",
                icon: "assets/icons/Settings.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Đăng xuất",
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
