import 'package:get/get.dart';

abstract class CheckoutContoller extends GetxController {
  getSelectedIndex(int index);
}

class CheckoutContollerImp extends CheckoutContoller {
  // selectedCheckoutIndex
  Rx<int> slctIndex = 0.obs;

  @override
  getSelectedIndex(int index) {
    slctIndex.value = 0;
  }
}
