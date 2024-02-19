import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/crud.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/data/models/doctor.dart';
import '../../../../core/utils/constant/export_constant.dart';

abstract class DoctorController extends GetxController {
  sendConsultation();
}

class DoctorControllerImp extends DoctorController {
  GetData getData = GetData(Get.find<Crud>());
  StatusRequest statusRequest = StatusRequest.none;
  final Rx<StatusRequest> anotherStatusRequest = StatusRequest.none.obs;
  Doctor? doctor;
  late TextEditingController consultationController;
  GetStorageControllerImp getStorage = Get.find();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    doctor = Get.arguments['doctor'];
    consultationController = TextEditingController();
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  sendConsultation() async {
    var userResponse = getStorage.getUserResponse('user');
    userResponse ??
        showDialogg('رسالة', 'يجب عليك تسجيل الدخول أولا .',
            loginMessage: true);
    if (userResponse != null) {
      anotherStatusRequest.value = StatusRequest.loading;
      final response = await getData.postData(
        "consultaions",
        {
          'user_id': userResponse.user.id,
          'doctor_id': doctor!.id,
          'type': 'question',
          'text': consultationController.text.trim(),
        },
        {'Authorization': 'Bearer ${userResponse.token}'},
      );
      anotherStatusRequest.value = handlingData(response);
      if (anotherStatusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
        } else {
          anotherStatusRequest.value == StatusRequest.failure;
          showDialogg('title', response['message']);
        }
      } else if (response['message'] == 'Unauthenticated.') {
        showDialogg('message', response['message']);
        goToLoginCreen;
      } else if (response['errors'].toString().isNotEmpty) {
        statusRequest = StatusRequest.success;
        showDialogg('title', response['message']);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    consultationController.dispose();
  }
}
