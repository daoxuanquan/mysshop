import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mysshop/screens/home/home_screen_controller.dart';

class ConfirmCodeController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  HomeScreenController homeScreenController = Get.find();
}
