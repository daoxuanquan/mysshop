import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mysshop/constants.dart';
import 'package:mysshop/models/Cart.dart';
import 'package:mysshop/screens/home/home_screen_controller.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  HomeScreenController homeScreenController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () => ListView.builder(
            itemCount: homeScreenController.selectedItems.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Dismissible(
                key: Key(
                    (homeScreenController.selectedItems.length + 1).toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    homeScreenController.selectedItems.removeAt(index);
                    print(
                        ' homeScreenController.selectedItems ${homeScreenController.selectedItems.length}');
                  });
                },
                background: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE6E6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      SvgPicture.asset("assets/icons/Trash.svg"),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 88,
                      child: AspectRatio(
                        aspectRatio: 0.88,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F6F9),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                                homeScreenController.selectedItems[index].image,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          child: Text(
                            homeScreenController.selectedItems[index].title,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            maxLines: 2,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text.rich(
                          TextSpan(
                            text:
                                "\$${homeScreenController.selectedItems[index].price}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor),
                            children: [
                              TextSpan(
                                  text: " x1",
                                  style: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
