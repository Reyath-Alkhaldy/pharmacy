import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/controller/user/auth/forgot_password_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/core/utils/helpers.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/core/class/status_request.dart';

abstract class ResetPasswordController extends GetxController {
  goToLoginScreen();
  resetPassword();
  fortgotPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController otpController;
  GetData getData = GetData(Get.find());
  GetStorageControllerImp getStorage = Get.find();
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final ForgotPasswordControllerImp forgotPasswordControllerImp =
      Get.find<ForgotPasswordControllerImp>();
  late String email;
  bool isShowPassword = true;
  bool isShowPasswordConfirm = true;

  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  showPasswordConfirm() {
    isShowPasswordConfirm = !isShowPasswordConfirm;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
    otpController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    update();
  }

  @override
  resetPassword() async {
    statusRequest.value = StatusRequest.loading;
    var response = await getData.postData(
      'password/reset',
      {
        'email': email,
        'password': passwordController.text.trim(),
        'password_confirmation': confirmPasswordController.text.trim(),
        'otp': otpController.text.trim()
      },
    );
    statusRequest.value = handlingData(response);

    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoute.login);
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Email Or P1assword Not Correct");
        statusRequest.value = StatusRequest.failure;
      }
    } else if (response['message'] == 'Unauthenticated.') {
      showDialogg('message', response['message']);
      goToLoginCreen;
    } else if (response['errors'].toString().isNotEmpty) {
      statusRequest.value = StatusRequest.success;
      showDialogg('title', response['message']);
    }
  }

  @override
  goToLoginScreen() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void dispose() {
    super.dispose();
    otpController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  fortgotPassword() async {
    statusRequest.value = StatusRequest.loading;
    try {
      await forgotPasswordControllerImp.fortgotPassword();
      statusRequest.value = StatusRequest.success;
    } catch (e) {
            showDialogg('Verification Code', 'هناك خطأ ما الان .');
      statusRequest.value = StatusRequest.success;

    }
  }
}
