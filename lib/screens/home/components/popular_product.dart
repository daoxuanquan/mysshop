import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysshop/components/product_card.dart';
import 'package:mysshop/models/Product.dart';
import 'package:mysshop/screens/home/home_screen_controller.dart';

import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  HomeScreenController homeScreenController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SectionTitle(title: "Mặt hàng bán chạy", press: () {}),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  homeScreenController.products.length,
                  (index) {
                    return ProductCard(
                        product: homeScreenController.products[index]);
                  },
                ),
                SizedBox(width: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
