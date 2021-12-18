import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mysshop/helper/custom_dialog.dart';
import 'package:mysshop/screens/home/home_screen.dart';

class SignInController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void onInit() {
    subcribeUser();
    super.onInit();
  }

  void subcribeUser() {
    auth.userChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        Get.offAll(() => HomeScreen());
        print(user);
        print('User is signed in!');
      }
    });
  }

  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.dialog(
          CustomDialog(
            message: "No user found for that email",
            title: "Alert",
          ),
        );
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.dialog(
          CustomDialog(
            message: "Wrong password provided for that user.'",
            title: "Alert",
          ),
        );
        print('Wrong password provided for that user.');
      }
    }
  }
}
