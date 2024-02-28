import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/controller/network/network_controller.dart';
import 'package:new_maps/controller/user/mobile_layout_controller.dart';

class NetWorkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetStorageControllerImp(), fenix: true);
    Get.lazyPut(() => MobileLayoutContollerImp(), fenix: true);

    Get.put(() => NetWorkController());
  }
}
