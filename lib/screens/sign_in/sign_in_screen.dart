import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysshop/screens/sign_in/sign_in_controller.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  SignInController signInController = Get.put(SignInController());
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Sign In"),
      // ),s
      body: Body(),
    );
  }
}
