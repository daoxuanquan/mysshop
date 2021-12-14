import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysshop/constants.dart';
import 'package:mysshop/screens/confirm_code/confirm_code_controller.dart';
import 'package:mysshop/screens/payment/index.dart';
import 'package:mysshop/screens/payment_succes/payment_success.dart';

class ConfirmCodeScreen extends StatefulWidget {
  const ConfirmCodeScreen({Key? key}) : super(key: key);

  @override
  _ConfirmCodeScreenState createState() => _ConfirmCodeScreenState();
}

class _ConfirmCodeScreenState extends State<ConfirmCodeScreen> {
  final ConfirmCodeController confirmCodeController =
      Get.put(ConfirmCodeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/images/confirm_code.png',
              height: 200,
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Hãy nhập mã code mà bạn nhận được!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              controller: confirmCodeController.textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: InkWell(
                onTap: () {
                  print('object');
                },
                child: InkWell(
                  onTap: () {
                    Get.to(() => PaymentSuccess());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: kPrimaryColor,
                    ),
                    height: 55,
                    width: 120,
                    child: Text(
                      'Gửi',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
