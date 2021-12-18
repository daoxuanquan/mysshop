import 'package:flutter/material.dart';
import 'package:mysshop/constants.dart';

class LoaddingCustomView extends StatelessWidget {
  const LoaddingCustomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: CircularProgressIndicator(
          color: kPrimaryColor,
          strokeWidth: 3,
        ),
      ),
    );
  }
}
