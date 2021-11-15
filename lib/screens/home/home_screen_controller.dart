import 'package:get/get.dart';
import 'package:mysshop/models/Product.dart';

class HomeScreenController extends GetxController {
  RxList<Product> selectedItems = <Product>[].obs;
  Rx<CustomBottomItemName> bottomBarItem = CustomBottomItemName.home.obs;

  void setCustomBottomBarItem(CustomBottomItemName itemName) {
    bottomBarItem.value = itemName;
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in selectedItems) {
      total += item.price;
    }
    return total;
  }
}

enum CustomBottomItemName { home, profile }
