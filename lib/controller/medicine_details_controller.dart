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
  StatusRequest statusRequest = StatusRequest.none;
  TabController? tabController;
  Rx<bool> isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    statusRequest = StatusRequest.loading;
    tabController = TabController(length: 2, vsync: this);
    isLoading.value == false;
    medicine = Get.arguments['medicine'];
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
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
