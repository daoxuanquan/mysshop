import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mysshop/constants.dart';
import 'package:mysshop/screens/cart/cart_screen.dart';
import 'package:mysshop/screens/home/components/icon_btn_with_counter.dart';
import 'package:mysshop/screens/home/home_screen_controller.dart';

class CustomAppBar extends StatelessWidget {
  HomeScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  primary: kPrimaryColor,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  "assets/icons/Back ICon.svg",
                  height: 17,
                ),
              ),
            ),
            Spacer(),
            Obx(
              () => IconBtnWithCounter(
                svgSrc: "assets/icons/Cart Icon.svg",
                press: () => Navigator.pushNamed(context, CartScreen.routeName),
                numOfitem: controller.selectedItems.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
