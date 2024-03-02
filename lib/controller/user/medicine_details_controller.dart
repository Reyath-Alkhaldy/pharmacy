import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/cart/cart_controller.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/data/models/medicine.dart';
import '../../core/class/status_request.dart';

abstract class MedicineDetailsController extends GetxController {
  increment();
  decrement();
  goBack();
  goToSignIn();
  addToCart();
}

class MedicineDetailsControllerImp extends MedicineDetailsController
    with GetSingleTickerProviderStateMixin {
  late Medicine medicine;
  StatusRequest statusRequest = StatusRequest.none;
  TabController? tabController;
  late CartControllerImp cartControllerImp;
  int count = 1;
  double total = 0.0;

  @override
  void onInit() {
    super.onInit();
    statusRequest = StatusRequest.loading;
    _getInit();
    statusRequest = StatusRequest.success;
    update();
  }

  _getInit() {
    cartControllerImp = Get.put(CartControllerImp());
    tabController = TabController(length: 2, vsync: this);
    medicine = Get.arguments['medicine'];
    total = medicine.price;
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
  goToSignIn() {
    Get.toNamed(AppRoute.login);
  }

  @override
  addToCart() async {
    statusRequest = StatusRequest.loading;
    await cartControllerImp.add(medicine, count);
    statusRequest = StatusRequest.success;
  }

  @override
  decrement() {
    if (count > 1) {
      count--;
      total = count * medicine.price;
      update();
    }
  }

  @override
  increment() {
    count++;
    total = count * medicine.price;
    update();
  }
}