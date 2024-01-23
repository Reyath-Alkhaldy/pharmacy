import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/class/crud.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/data/models/doctors.dart';
abstract class ConsulatiolnController extends GetxController {
  postConsultaion();
}

class ConsulatiolnControllerImp extends ConsulatiolnController {
  GetData getData = GetData(Get.find<Crud>());
  StatusRequest statusRequest = StatusRequest.none;
  final Rx<StatusRequest> anotherStatusRequest = StatusRequest.none.obs;
  late Doctor doctor;

  @override
  void onInit() {
    super.onInit();
    statusRequest = StatusRequest.loading;
    update();
    doctor = Get.arguments['doctor'];
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  postConsultaion() async {
    try {
      statusRequest = StatusRequest.loading;
      final response = await getData.postData("consultaions", {});
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
        } else {
          statusRequest == StatusRequest.failure;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("هناك خطأ  ");
      }
      e.printError();
    }
  }
}
