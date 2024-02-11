import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/data/models/user.dart';
import '../../../core/utils/constant/export_constant.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToLogin();
  changeUserType(userType);
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController addressController;
  GetData getData = GetData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  bool isShowPassword = true;
  bool isShowPasswordConfirm = true;
  late UserResponse userResponse;
  GetStorageControllerImp getStorage = Get.find<GetStorageControllerImp>();

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
      'name': nameController.text.trim().toString(),
      'phone_number': phoneNumberController.text.trim().toString(),
      'password': passwordController.text.trim().toString(),
      'password_confirmation': confirmPasswordController.text.trim().toString(),
      'address': addressController.text.trim().toString(),
      'email': emailController.text.trim().toString(),
    };
    return dt;
  }

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest.value = StatusRequest.loading;
      var response = await getData.postData('register', data);
      statusRequest.value = handlingData(response);

      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          userResponse = UserResponse.fromMap(response);
          await getStorage.instance.write('user', userResponse.toJson());
          Get.offNamed(AppRoute.verificationEmailScreen,
              arguments: {'user': userResponse});
        } else {
          showDialogg('title', response['message']);
        }
      } else if (response['message'] == 'Unauthenticated.') {
        showDialogg('message', response['message']);
        goToLoginCreen;
      } else if (response['errors'].toString().isNotEmpty) {
        statusRequest.value = StatusRequest.success;
        showDialogg('title', response['message']);
      }
    }
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoute.login);
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
