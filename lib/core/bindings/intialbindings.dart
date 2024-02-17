import 'package:get/get.dart';
import 'package:new_maps/core/class/crud.dart';
import '../../controller/user/mobile_layout_controller.dart';
import '../../controller/user/pharmacies/pharmacy_paginate_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(MobileLayoutContollerImp());
    Get.put(PharmacyPaginateControllerImp());
    
  }
}
