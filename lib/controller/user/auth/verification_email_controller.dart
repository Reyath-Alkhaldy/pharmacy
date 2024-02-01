import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/data/models/user.dart';

abstract class VerificationEmailController extends GetxController {
  goToPharmacyScreen();
  verificationEmail(otp);
  sendEmailVerification();
}

// showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: const Text("Verification Code"),
//         content: Text('Code entered is $verificationCode'),
//       );
//     });
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
        goToPharmacyScreen();
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Email Or P1assword Not Correct");
        statusRequest.value = StatusRequest.failure;
      }
    } else {}
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
  goToPharmacyScreen() {
    Get.offNamed(AppRoute.pharmacy);
  }
}
