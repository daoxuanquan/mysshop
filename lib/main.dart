import 'package:flutter/material.dart';
import 'package:mysshop/routes.dart';
import 'package:mysshop/screens/sign_in/sign_in_screen.dart';
import 'package:mysshop/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      home: SignInScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SignInScreen.routeName,
      routes: routes,
    );
  }
}
