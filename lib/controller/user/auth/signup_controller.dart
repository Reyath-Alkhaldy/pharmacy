import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/data/database/remote/get_data.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToLogin();
  goToPharmacyScreen();
}

class SignUpControllerImp extends SignUpController {
   late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController emailController;
  late TextEditingController nameController;
  GetData getData = GetData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final Rx<StatusRequest> anotherStatusRequest = StatusRequest.none.obs;
  bool isshowpassword = true;

  showPassword() {
    isshowpassword = !isshowpassword;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController(); 
    confirmPasswordController = TextEditingController();
    emailController = TextEditingController();
    nameController = TextEditingController();
  }
  @override
  signUp() {
    // 
    throw UnimplementedError();
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  goToPharmacyScreen() {
    Get.offNamed(AppRoute.pharmacy);
  }
}
