import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysshop/constants.dart';
import 'package:mysshop/screens/cart/cart_controller.dart';
import 'package:mysshop/screens/home/home_screen_controller.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  HomeScreenController homeScreenController = Get.find();
  CartController cartController = Get.put(CartController());
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      title: Column(
        children: [
          Text(
            "Giỏ của bạn",
            style: TextStyle(color: Colors.black),
          ),
          Obx(
            () => Text(
              "${homeScreenController.selectedItems.length} items",
              style: Theme.of(context).textTheme.caption,
            ),
          )
        ],
      ),
    );
  }
}
