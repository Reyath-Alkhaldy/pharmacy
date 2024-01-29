import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/data/models/user.dart';

abstract class ResetPasswordController extends GetxController {
  signUp();
  goToLogin();
  goToPharmacyScreen();
  changeUserType(userType);
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController addressController;
  GetData getData = GetData(Get.find());
  GetStorageControllerImp getStorage = Get.find();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  bool isShowPassword = true;
  bool isShowPasswordConfirm = true;
  late UserResponse userResponse;
  final List list = ['عميل', 'دكتور', 'صيدلية', 'مدير'];
  RxInt userType = 1.obs;

  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  showPasswordConfirm() {
    isShowPasswordConfirm = !isShowPasswordConfirm;
    update();
  }

  @override
  changeUserType(userType) {}
  @override
  void onInit() {
    super.onInit();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    emailController = TextEditingController();
    nameController = TextEditingController();
    addressController = TextEditingController();
  }

  Map<String, dynamic> get data {
    Map<String, dynamic> dt = {
      'user_type': userType.value,
      'name': nameController.text.trim().toString(),
      'phone_number': phoneNumberController.text.trim().toString(),
      'password': passwordController.text.trim().toString(),
      'password_confirmation': confirmPasswordController.text.trim().toString(),
    };
    if (userType.value == 3) {
      dt.addAll({'address': addressController.text.trim().toString()});
    }
    if (userType.value != 1) {
      dt.addAll({'email': emailController.text.trim().toString()});
    }
    return dt;
  }

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest.value == StatusRequest.loading;
      var response = await getData.postData('register', data);
      statusRequest.value = handlingData(response);

      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          userResponse = UserResponse.fromMap(response);
          await getStorage.instance.write('user', userResponse.toMap());
          Get.offNamed(AppRoute.verificationEmailScreen,
              arguments: {'user': userResponse});
        } else {
          Get.defaultDialog(
              title: "ُWarning",
              middleText: response['message'],
              confirm: const Text('he'));
          statusRequest.value = StatusRequest.failure;
          update();
        }
      } else {
        Get.defaultDialog(
            title: "ُWarning",
            middleText: response['message'],
            confirm: const Text('he'));
        statusRequest.value = StatusRequest.failure;
        update();
      }
    }
  }

  set setUserType(String type) => list[0] == type
      ? userType.value = 1
      : list[1] == type
          ? userType.value = 2
          : list[2] == type
              ? userType.value = 3
              : userType.value = 4;

  @override
  goToLogin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  goToPharmacyScreen() {
    Get.offNamed(AppRoute.pharmacy);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
