import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/data/models/doctor.dart';
import 'package:pinput/pinput.dart';
import '../../../core/utils/constant/export_constant.dart';

abstract class SignUpDoctorController extends GetxController {
  signUp();
  goToLogin();
  setSpecialtyId(String specialtyId);
}

class SignUpDoctorControllerImp extends SignUpDoctorController {
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  late TextEditingController specialtyIdController;
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController addressController;
  GetData getData = GetData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  bool isShowPassword = true;
  bool isShowPasswordConfirm = true;
  late DoctorResponse doctorResponse;
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
  void onInit() {
    super.onInit();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    specialtyIdController = TextEditingController();
    emailController = TextEditingController();
    nameController = TextEditingController();
    addressController = TextEditingController();
  }

  Map<String, dynamic> get data {
    Map<String, dynamic> dt = {
      'name': nameController.text.trim().toString(),
      'phone_number': phoneNumberController.text.trim().toString(),
      'password': passwordController.text.trim().toString(),
      'specialty_id': specialtyIdController.text.trim().toString(),
      'address': addressController.text.trim().toString(),
      'email': emailController.text.trim().toString(),
    };
    return dt;
  }

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest.value = StatusRequest.loading;
      var response = await getData.postData('doctor/register', data);
      statusRequest.value = handlingData(response);

      print(response);
      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          doctorResponse = DoctorResponse.fromMap(response);
          await getStorage.instance.write('doctor', doctorResponse.toJson());
          Get.offNamed(AppRouteDoctor.verificationEmailDoctorScreen,
              arguments: {'doctor': doctorResponse});
        } else {
          statusRequest.value = StatusRequest.success;
          await showDialogDoctor('title', response['message']);
        }
      } else if (statusRequest.value == StatusRequest.serverfailure) {
        statusRequest.value = StatusRequest.success;
          await showDialogDoctor('خطأ','هناك خطأ في السيرفر');

      } else if (response['errors'].toString().isNotEmpty) {
        statusRequest.value = StatusRequest.success;
      }
    }
  }

  @override
  goToLogin() {
    Get.offNamed(AppRouteDoctor.loginDoctor);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    passwordController.dispose();
    specialtyIdController.dispose();
    super.dispose();
  }

  @override
  setSpecialtyId(String specialtyId) {
    specialtyIdController.setText(specialtyId);
    update();
  }
}
