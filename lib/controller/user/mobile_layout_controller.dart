import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MobileLayoutContoller extends GetxController {
  jumpToAnotherPage(int i);
}

class MobileLayoutContollerImp extends MobileLayoutContoller {
  late PageController pageController;
  Rx<int> index = 1.obs;
  Rx<String> title = ''.obs;
  List titles = ['المزيد', 'الصفحة الرئيسية', 'الإستشارات'];
  @override
  void onInit() {
    super.onInit();
    title.value = titles[1];
    pageController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  jumpToAnotherPage(int i) {
    title.value = titles[i];
    index.value = i;
    pageController.jumpToPage(i);
  }
}
