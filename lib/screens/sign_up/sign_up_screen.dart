import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysshop/screens/sign_up/sign_up_controller.dart';
import 'package:mysshop/widgets/loading_view.dart';

import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpController signUpController = Get.put(SignUpController());
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Body(),
          signUpController.isLoading.value == true
              ? LoaddingCustomView()
              : SizedBox()
        ],
      ),
    );
  }
}
