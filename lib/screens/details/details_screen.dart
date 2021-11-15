import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysshop/constants.dart';
import 'package:mysshop/screens/cart/cart_screen.dart';
import 'package:mysshop/screens/home/home_screen_controller.dart';

import '../../models/Product.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  final HomeScreenController _homeScreenController = Get.find();
  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      body: Stack(
        children: [
          Body(product: agrs.product),
          Positioned(
            child: CustomAppBar(),
            top: 0,
            left: 0,
          ),
          Positioned(
            child: getBottomDetail(context),
            bottom: 0,
          )
        ],
      ),
    );
  }

  Widget getBottomDetail(BuildContext context) {
    final ProductDetailsArguments agrs =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    double bottomHeight = 50;
    return Container(
        height: bottomHeight,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
                child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.blue,
                      height: bottomHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sms,
                            color: Colors.white,
                            size: 23,
                          ),
                          Text(
                            'Chat ngay',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: bottomHeight,
                    width: 1,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _homeScreenController.selectedItems.add(agrs.product);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.blue,
                        height: bottomHeight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_shopping_cart,
                              color: Colors.white,
                              size: 23,
                            ),
                            Text(
                              'Add cart',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
              child: Container(
                alignment: Alignment.center,
                height: bottomHeight,
                color: kPrimaryColor,
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  'Mua ngay',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )),
          ],
        ));
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
