import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/core/utils/helpers.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'forgot_password_doctor_controller.dart';

abstract class ResetPasswordDoctorController extends GetxController {
  goToLoginScreen();
  resetPassword();
  fortgotPassword();
}

class ResetPasswordDoctorControllerImp extends ResetPasswordDoctorController {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController otpController;
  GetData getData = GetData(Get.find());
  GetStorageControllerImp getStorage = Get.find();
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final ForgotPasswordDoctorControllerImp controller =
      Get.find<ForgotPasswordDoctorControllerImp>();
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
      'doctor/password/reset',
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
      showDialogDoctor('message', response['message']);
    } else if (response['errors'].toString().isNotEmpty) {
      statusRequest.value = StatusRequest.success;
      showDialogDoctor('title', response['message']);
    }
  }

  @override
  goToLoginScreen() {
    Get.offNamed(AppRouteDoctor.loginDoctor);
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
      await controller.fortgotPassword();
      statusRequest.value = StatusRequest.success;
    } catch (e) {
      statusRequest.value = StatusRequest.success;
      showDialogDoctor('Verification Code', 'هناك خطأ ما الان .');
    }
  }
}
