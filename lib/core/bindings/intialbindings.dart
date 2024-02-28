import 'package:get/get.dart';
import 'package:new_maps/core/class/crud.dart';
import '../../controller/user/pharmacies/pharmacy_paginate_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Crud(), fenix: true);
    Get.put(PharmacyPaginateControllerImp());
  }
}
