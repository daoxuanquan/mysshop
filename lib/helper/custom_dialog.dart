import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  String? title;
  String message;
  CustomDialog({this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // titleTextStyle: TextStyle(),
      title: Text(
        title ?? "",
        textAlign: TextAlign.center,
      ),
      content: Container(
        padding: EdgeInsets.all(20),
        child: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
