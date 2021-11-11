import 'package:flutter/widgets.dart';
import 'package:mysshop/screens/cart/cart_screen.dart';
import 'package:mysshop/screens/complete_profile/complete_profile_screen.dart';
import 'package:mysshop/screens/details/details_screen.dart';
import 'package:mysshop/screens/forgot_password/forgot_password_screen.dart';
import 'package:mysshop/screens/home/home_screen.dart';
import 'package:mysshop/screens/otp/otp_screen.dart';
import 'package:mysshop/screens/profile/profile_screen.dart';
import 'package:mysshop/screens/sign_in/sign_in_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
