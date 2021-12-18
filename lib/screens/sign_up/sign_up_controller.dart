import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:mysshop/helper/custom_dialog.dart';

class SignUpController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> register(String email, String password) async {
    try {
      isLoading.value = true;
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Get.dialog(
        CustomDialog(
          message: "Register successful!",
          title: "Alert",
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.dialog(
          CustomDialog(
            message: "The password provided is too weak.",
            title: "Alert",
          ),
        );
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.dialog(
          CustomDialog(
            message: "The account already exists for that email.",
            title: "Alert",
          ),
        );
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
