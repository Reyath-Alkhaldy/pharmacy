import 'package:get/get.dart';
import 'package:new_maps/controller/mobile_layout_controller.dart';
import 'package:new_maps/controller/pharmacy_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MobileLayoutContollerImp());
    Get.put(PharmacyControllerImp());
  }
}
