import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  Rx<CustomBottomItemName> bottomBarItem = CustomBottomItemName.home.obs;

  void setCustomBottomBarItem(CustomBottomItemName itemName) {
    bottomBarItem.value = itemName;
  }
}

enum CustomBottomItemName { home, profile }
