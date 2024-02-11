import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/data/models/user.dart';
import '../../../core/utils/constant/export_constant.dart';

abstract class VerificationEmailController extends GetxController {
  goToMobileLayoutScreen();
  verificationEmail(otp);
  sendEmailVerification();
}

class VerificationEmailControllerImp extends VerificationEmailController {
  GetData getData = GetData(Get.find());
  GetStorageControllerImp getStorage = Get.find();
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  late UserResponse userResponse;

  @override
  void onInit() {
    //
    super.onInit();
    userResponse = Get.arguments['user'];
  }

  @override
  verificationEmail(otp) async {
    statusRequest.value = StatusRequest.loading;
    var response = await getData.postData(
        'email-verification',
        {'email': userResponse.user.email, 'otp': otp},
        {'Authorization': 'Bearer ${userResponse.token}'});
    statusRequest.value = handlingData(response);

    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        goToMobileLayoutScreen();
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Email Or P1assword Not Correct");
        statusRequest.value = StatusRequest.failure;
      }
    } else {
      showDialogg('title', response['message']);
    }
  }

  @override
  sendEmailVerification() async {
    statusRequest.value = StatusRequest.loading;
    var response = await getData.getData(
        'email-verification',
        {'email': userResponse.user.email},
        {'Authorization': 'Bearer ${userResponse.token}'});
    statusRequest.value = handlingData(response);

    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        showDialog(
            context: Get.context!,
            builder: (context) {
              return const AlertDialog(
                title: Text("Verification Code"),
                content: Text('"Verification Code is resend'),
              );
            });
      } else {}
    }
  }

  @override
  goToMobileLayoutScreen() {
    Get.offNamed(AppRoute.mobileLayoutScreen);
  }
}
