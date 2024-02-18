import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/data/models/doctor.dart';

abstract class LoginDoctorController extends GetxController {
  goToSignUp();
  goToForgotPasswordScreen();
  // goToConsultationScreen();
  login();
}

class LoginDoctorControllerImp extends LoginDoctorController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GetData getData = GetData(Get.find());
  GetStorageControllerImp getStorage = Get.find();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  bool isshowpassword = true;
  late DoctorResponse doctorResponse;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest.value = StatusRequest.loading;
      var response = await getData.postData('doctor/auth/access-tokens', {
        'email': emailController.text.trim().toString(),
        'password': passwordController.text.trim().toString()
      });
      statusRequest.value = handlingData(response);

      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          doctorResponse = DoctorResponse.fromMap(response);
          await getStorage.instance.write('doctor', doctorResponse.toJson());

          Get.offNamed(AppRouteDoctor.doctorConsulationsScreen);
        } else {
          statusRequest.value = StatusRequest.success;
          await showDialogDoctor('title', response['message']);
        }
      }
       if (response['errors'].toString().isNotEmpty) {
        statusRequest.value = StatusRequest.success;
        showDialogDoctor('title', response['message']);
      }
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRouteDoctor.signUpDoctor);
  }

  // @override
  // goToConsultationScreen() {
  //   Get.offNamed(AppRouteDoctor.);
  // }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  goToForgotPasswordScreen() {
    Get.toNamed(AppRouteDoctor.forgotPasswordDoctorScreen);
  }
}
