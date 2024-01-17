
import 'package:get/get.dart';
import 'package:new_maps/core/class/status_request.dart';

abstract class ControlPanalController extends GetxController{

}

class ControlPanalControllerImp extends ControlPanalController{
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;

}