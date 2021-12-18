import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mysshop/models/Product.dart';
import 'package:mysshop/models/product_model.dart';

class HomeScreenController extends GetxController {
  HomeScreenController() {
    getProducts();
  }

  RxList<ProductModel> selectedItems = <ProductModel>[].obs;
  RxList<ProductModel> products = <ProductModel>[].obs;

  Rx<CustomBottomItemName> bottomBarItem = CustomBottomItemName.home.obs;

  void setCustomBottomBarItem(CustomBottomItemName itemName) {
    bottomBarItem.value = itemName;
  }

  Future<void> getProducts() async {
    try {
      var response = await Dio().get('http://localhost:3000/get_products');
      for (var item in response.data) {
        ProductModel product = ProductModel.fromJson(item);
        products.add(product);
        print(product.id);
      }
    } catch (e) {
      print(e);
    }
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in selectedItems) {
      total += double.parse(item.price);
    }
    return total;
  }
}

enum CustomBottomItemName { home, profile }
