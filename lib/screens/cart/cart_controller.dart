import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mysshop/reopository.dart';

class CartController extends GetxController {
  final AppRepository appRepository = AppRepository();

  CartController() {
    print('init cart controller');
    getJson();
  }

  void getJson() async {
    await appRepository.initRequet();
  }
}
