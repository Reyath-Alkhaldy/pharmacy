import 'package:get/get.dart';
import 'package:new_maps/controller/user/cart/cart_controller.dart';
import 'package:new_maps/controller/user/pharmacies/pharmacy_controller.dart';
import 'package:new_maps/core/class/crud.dart';
import '../../controller/pharmacy/mobile_layout_pharmacy_controller.dart';
import '../../controller/user/mobile_layout_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(MobileLayoutContollerImp());
    Get.put(MobileLayoutPharmacyContollerImp());
    Get.put(PharmacyControllerImp());
    Get.put(CartControllerImp());
    
  }
}
