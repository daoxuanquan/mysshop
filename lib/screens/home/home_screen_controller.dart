import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mysshop/constants.dart';
import 'package:mysshop/models/card_model.dart';
import 'package:mysshop/models/product_model.dart';
import 'package:mysshop/screens/confirm_code/confirm_code_screen.dart';
import 'package:mysshop/screens/sign_in/sign_in_controller.dart';

class HomeScreenController extends GetxController {
  HomeScreenController() {
    getProducts();
  }
  SignInController signInController = Get.find();
  RxList<ProductModel> selectedItems = <ProductModel>[].obs;
  RxList<ProductModel> products = <ProductModel>[].obs;
  Rx<CardModel> card =
      CardModel(cardNumber: "", cardHolder: "", cvv: "", title: "", expired: "")
          .obs;
  Rx<CustomBottomItemName> bottomBarItem = CustomBottomItemName.home.obs;

  void setCustomBottomBarItem(CustomBottomItemName itemName) {
    bottomBarItem.value = itemName;
  }

  Future<void> getProducts() async {
    try {
      var response = await Dio().get('http://localhost:3000/get_products',
          options: Options(headers: {"id_token": signInController.token}));
      for (var item in response.data) {
        ProductModel product = ProductModel.fromJson(item);
        products.add(product);
        print(product.id);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> requestOrder() async {
    try {
      EasyLoading.showProgress(0.3, status: 'downloading...');
      var response = await Dio().post('http://localhost:3000/request_order',
          data: {
            "order": {"products": jsonDecode(getSelectedProductString())}
          },
          options: Options(headers: {"id_token": signInController.token}));
      if (response.data["error"] == true) {
        print(response.data);
        showError(Get.context!, "Some error has occurred");
      } else {
        showConfirmBuy(Get.context!, response.data["order"]["total"],
            response.data["transaction_id"]);
      }
    } catch (e) {
      print(e);
      showError(Get.context!, "Some error has occurred");
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> requestPurchaseConfirm(
      String total, String transactionId) async {
    try {
      EasyLoading.showProgress(0.3, status: 'downloading...');
      var response = await Dio().post('http://localhost:3000/request_purchase',
          data: {
            "order": {
              "products": getSelectedProductString(),
              "total": total,
            },
            "transaction_id": transactionId,
            "card_information": getCardInfomationString()
          },
          options: Options(headers: {"id_token": signInController.token}));

      if (response.statusCode == 200) {
        Get.to(() => ConfirmCodeScreen());
      } else {
        showError(Get.context!, response.data);
      }
    } catch (e) {
      print(e);
      showError(Get.context!, "Some error has occurred when request purchase");
    } finally {
      EasyLoading.dismiss();
    }
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in selectedItems) {
      total += double.parse(item.price);
    }
    return total;
  }

  void showConfirmBuy(
      BuildContext buildContext, String total, String transactionId) {
    AwesomeDialog(
      context: buildContext,
      dialogType: DialogType.QUESTION,
      animType: AnimType.BOTTOMSLIDE,
      desc: 'Tổng giá trị đơn hàng là $total \n Bạn đồng ý mua ?',
      btnCancelText: "No",
      btnOkText: "Yes",
      btnOk: InkWell(
        onTap: () {
          Get.back();
          requestPurchaseConfirm(total, transactionId);
        },
        child: Container(
          color: kPrimaryColor,
          width: 80,
          height: 40,
          child: Text(
            "Yes",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          alignment: Alignment.center,
        ),
      ),
      btnCancel: InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          color: Colors.grey[300],
          width: 80,
          height: 40,
          child: Text(
            "No",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          alignment: Alignment.center,
        ),
      ),
    ).show();
  }

  void showError(BuildContext buildContext, String message) {
    AwesomeDialog(
      context: buildContext,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,
      desc: message,
      btnOkText: "OK",
      // btnOkOnPress: () {}
    ).show();
  }

  String getCardInfomationString() {
    return '{"card_holder": "${card.value.cardHolder}", "card_number": "${card.value.cardNumber.replaceAll(" ", "")}", "ccv": "${card.value.cvv}", "expired_date": "${card.value.expired}"}';
  }

  String getSelectedProductString() {
    var productsString = "[";
    for (var product in selectedItems) {
      productsString += product.toString();
      productsString += ",";
    }
    // remove the last ,
    productsString = productsString.substring(0, productsString.length - 1);

    return productsString + "]";
  }
}

enum CustomBottomItemName { home, profile }
