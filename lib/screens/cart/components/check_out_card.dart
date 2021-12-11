import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mysshop/components/default_button.dart';
import 'package:mysshop/screens/confirm_code/confirm_code_screen.dart';
import 'package:mysshop/screens/home/home_screen_controller.dart';
import 'package:mysshop/screens/payment/index.dart';

import '../../../constants.dart';

class CheckoutCard extends StatelessWidget {
  HomeScreenController controller = Get.find();
  CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.paid,
                  size: 35,
                  color: kPrimaryColor,
                ),
                Spacer(),
                Text(
                  "VCB<****>",
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text.rich(
                    TextSpan(
                      text: "Tổng tiền:\n",
                      children: [
                        TextSpan(
                          text: controller.getTotalPrice().toStringAsFixed(2),
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 190,
                  child: DefaultButton(
                    text: "Thanh toán",
                    press: () {
                      Get.to(() => ConfirmCodeScreen());
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
