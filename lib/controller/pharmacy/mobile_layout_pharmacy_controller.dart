import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MobileLayoutPharmacyContoller extends GetxController {
  jumpToAnotherPage(int i);
}

class MobileLayoutPharmacyContollerImp extends MobileLayoutPharmacyContoller {
  late PageController pageController;
  Rx<int> index = 3.obs;
  Rx<String> title = ''.obs;
  List titles = ['التقارير', 'سجل الطلبات', 'إدارة المخزون','لوحة التحكم'];
  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 3);
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
