import 'package:get/get.dart';

abstract class OrderHistoryController extends GetxController {
  void getTabSelected(int tabIndex);
}

class OrderHistoryControllerImp extends OrderHistoryController {
  int tabIndex = 0;

  @override
  void getTabSelected(int tabIndex) {
    if (this.tabIndex != tabIndex) {
      this.tabIndex = tabIndex;
      update();
    }
  }
}
