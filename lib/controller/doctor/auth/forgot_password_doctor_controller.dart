import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/core/utils/helpers.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/core/class/status_request.dart';

abstract class ForgotPasswordDoctorController extends GetxController {
  fortgotPassword();
}

class ForgotPasswordDoctorControllerImp extends ForgotPasswordDoctorController {
  late TextEditingController emailController;
  GetData getData = GetData(Get.find());
  GetStorageControllerImp getStorage = Get.find();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  bool isshowpassword = true;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  fortgotPassword() async {
    if (formstate.currentState!.validate()) {
      statusRequest.value = StatusRequest.loading;
      var response = await getData.postData('doctor/password/forgot-password', {
        'email': emailController.text.trim().toString(),
      });
      statusRequest.value = handlingData(response);

      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.toNamed(AppRoute.resetPasswordScreen, arguments: {
            'email': emailController.text.trim().toString(),
          });
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Email Or Password Not Correct");
          statusRequest.value = StatusRequest.failure;
        }
      }   if (response['message'] == 'Unauthenticated.') {
        showDialogDoctor('message', response['message']);
        goToLoginCreen;
      } else if (response['errors'].toString().isNotEmpty) {
        statusRequest.value = StatusRequest.success;
        showDialogDoctor('title', response['message']);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }
}
