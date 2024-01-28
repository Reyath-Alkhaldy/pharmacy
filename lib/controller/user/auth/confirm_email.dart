import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/data/models/user.dart';

abstract class ConfirmEmail extends GetxController {
  goToSignUp();
  goToPharmacyScreen();
  login();
}

class ConfirmEmailImp extends ConfirmEmail {
  late TextEditingController emailController;
  late TextEditingController confirmCodeController;
  GetData getData = GetData(Get.find());
  GetStorageControllerImp getStorage = Get.find();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  int userType = 1;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    confirmCodeController = TextEditingController();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest.value == StatusRequest.loading;
      var response = await getData.postData('auth/access-tokens', {
        'user_type': userType,
        'phone_number': emailController.text.trim().toString(),
        'password': confirmCodeController.text.trim().toString()
      });
      statusRequest.value = handlingData(response);

      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoute.mobileLayoutScreen);
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Email Or Password Not Correct");
          statusRequest.value = StatusRequest.failure;
        }
      } else {
        update();
      }
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  goToPharmacyScreen() {
    Get.offNamed(AppRoute.pharmacy);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    confirmCodeController.dispose();
  }
}
