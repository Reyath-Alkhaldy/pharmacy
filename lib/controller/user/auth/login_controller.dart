import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/data/models/user.dart';

abstract class LoginController extends GetxController {
  goToSignUp();
  goToForgotPasswordScreen();
  goToPharmacyScreen();
  login();
}

class LoginControllerImp extends LoginController {
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  GetData getData = GetData(Get.find());
  GetStorageControllerImp getStorage = Get.find();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  bool isshowpassword = true;
  late UserResponse userResponse;
  final List list = ['عميل', 'دكتور', 'صيدلية', 'مدير'];
  RxInt userType = 1.obs;
  String? deviceId;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest.value == StatusRequest.loading;
      var response = await getData.postData('auth/access-tokens', {
        'user_type': userType,
        'phone_number': phoneNumberController.text.trim().toString(),
        'password': passwordController.text.trim().toString()
      });
      statusRequest.value = handlingData(response);

      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          userResponse = UserResponse.fromMap(response);
          await getStorage.instance.write('user', userResponse.toMap());
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
    phoneNumberController.dispose();
    passwordController.dispose();
  }

  @override
  goToForgotPasswordScreen() {
    Get.toNamed(AppRoute.forgotPasswordScreen);
  }
}
