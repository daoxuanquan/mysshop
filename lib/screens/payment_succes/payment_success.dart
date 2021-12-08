import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysshop/constants.dart';
import 'package:mysshop/screens/home/home_screen.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  _PaymentSuccessState createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/tick_icon.png',
            height: 120,
          ),
          Text(
            'Success!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Thank you for using our service!',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 48,
          ),
          InkWell(
            onTap: () {
              Get.offAll(HomeScreen());
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kPrimaryColor,
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 32),
              height: 45,
              width: MediaQuery.of(context).size.width - 48,
              child: Text(
                'Ok',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }
}
