import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/data/models/user.dart';

abstract class ForgotPasswordController extends GetxController {
  goToForgotPasswordScreen();
  goToPharmacyScreen();
  fortgotPassword();
}

class ForgotPasswordControllerImp extends ForgotPasswordController {
  late TextEditingController emailController;
  GetData getData = GetData(Get.find());
  GetStorageControllerImp getStorage = Get.find();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  bool isshowpassword = true;
  final List list = ['عميل', 'دكتور', 'صيدلية', 'مدير'];
  RxInt userType = 1.obs;


  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  fortgotPassword() async {
    if (formstate.currentState!.validate()) {
      statusRequest.value == StatusRequest.loading;
      var response = await getData.postData('password/forgot-password', {
        'user_type': userType,
        'email': emailController.text.trim().toString(),
      });
      statusRequest.value = handlingData(response);

      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoute.verificationEmailScreen);
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
  goToPharmacyScreen() {
    Get.offNamed(AppRoute.pharmacy);
  }

  set setUserType(String type) => list[0] == type
      ? userType.value = 1
      : list[1] == type
          ? userType.value = 2
          : list[2] == type
              ? userType.value = 3
              : userType.value = 4;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  goToForgotPasswordScreen() {
    Get.toNamed(AppRoute.forgotPasswordScreen);
  }
}
