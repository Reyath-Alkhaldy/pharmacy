import 'package:get/get.dart';
import 'package:new_maps/controller/network/network_controller.dart';

class NetWorkBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => NetWorkController());
  }
}
