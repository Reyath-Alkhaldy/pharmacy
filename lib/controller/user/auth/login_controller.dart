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
      statusRequest.value = StatusRequest.loading;
      var response = await getData.postData('auth/access-tokens', {
        'phone_number': phoneNumberController.text.trim().toString(),
        'password': passwordController.text.trim().toString()
      });
      statusRequest.value = handlingData(response);

      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          userResponse = UserResponse.fromMap(response);
          await getStorage.instance.write('user', userResponse.toJson());

          Get.offNamed(AppRoute.mobileLayoutScreen);
        } else {
          showDialog(
              context: Get.context!,
              builder: (context) {
                return AlertDialog(
                  title: Text("status was ${response['status']}"),
                  content: Text(response['message']),
                );
              });
        }
      } else if (response['errors'].isNotEmpty) {
        statusRequest.value = StatusRequest.success;
        showDialog(
            context: Get.context!,
            builder: (context) {
              return AlertDialog(
                title: Text("status was ${response['status']}"),
                content: Text(response['message']),
                actions: const [
                  InkWell(
                    child: Text('cancel'),
                  ),
                  InkWell(
                    child: Text('ok'),
                  ),
                ],
              );
            });
      }
    }
  }

  showDialogg(title, message) => showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: const Text('exit'),
            )
          ],
        );
      });

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
    phoneNumberController.dispose();
    passwordController.dispose();
  }

  @override
  goToForgotPasswordScreen() {
    Get.toNamed(AppRoute.forgotPasswordScreen);
  }
}
