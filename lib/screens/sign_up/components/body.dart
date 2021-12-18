import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysshop/components/socal_card.dart';
import 'package:mysshop/constants.dart';
import 'package:mysshop/screens/sign_up/sign_up_controller.dart';
import 'package:mysshop/widgets/loading_view.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  SignUpController signUpController = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                        height:
                            MediaQuery.of(context).size.height * 0.04), // 4%
                    Text("Đăng ký", style: headingStyle),
                    Text(
                      "Điền đầy đủ thông tin hoặc bạn có thể đăng nhập bằng tài khoản mạng xã hội",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    SignUpForm(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocalCard(
                          icon: "assets/icons/google-icon.svg",
                          press: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Bằng việc tiếp tục đăng ký bạn đã đồng ý với điều khoản của chúng tôi',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
