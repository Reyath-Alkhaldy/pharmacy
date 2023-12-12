import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MobileLayoutContoller extends GetxController {
  jumpToAnotherPage(int i);
}

class MobileLayoutContollerImp extends MobileLayoutContoller {
  late PageController pageController;
  var index = 1.obs;
  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  jumpToAnotherPage(int i) {
    index.value = i;
    pageController.jumpToPage(i);
  }
}
