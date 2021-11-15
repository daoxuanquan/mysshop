import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysshop/screens/cart/cart_screen.dart';
import 'package:mysshop/screens/home/home_screen_controller.dart';

import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  HomeScreenController homeScreenController = Get.find();
  HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          Obx(
            () => IconBtnWithCounter(
              numOfitem: homeScreenController.selectedItems.length,
              svgSrc: "assets/icons/Cart Icon.svg",
              press: () => Navigator.pushNamed(context, CartScreen.routeName),
            ),
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
