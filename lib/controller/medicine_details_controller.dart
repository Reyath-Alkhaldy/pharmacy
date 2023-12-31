import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/data/models/medicine.dart';

import '../core/class/status_request.dart';

abstract class MedicineDetailsController extends GetxController {
  goBack();
  goToCart();
  goToSignIn();
}

class MedicineDetailsControllerImp extends MedicineDetailsController
    with GetSingleTickerProviderStateMixin {
  late Medicine medicine;
  Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  late TabController tabController;
final List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];
  @override
  void onInit() {
    statusRequest.value = StatusRequest.loading;
    super.onInit();
    medicine = Get.arguments['medicine'];
    tabController = TabController(length: myTabs.length, vsync: this);
    statusRequest.value = StatusRequest.success;
    update();
  }

  @override
  goBack() {
    Get.back();
  }

  @override
  goToCart() {
    throw UnimplementedError();
  }

  @override
  goToSignIn() {
    Get.toNamed(AppRoute.login);
  }
}
