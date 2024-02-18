import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/data/models/doctor.dart';
import '../../../core/utils/constant/export_constant.dart';

abstract class VerificationEmailDoctorController extends GetxController {
  verificationEmail(otp);
  sendEmailVerification();
}

class VerificationEmailDoctorControllerImp
    extends VerificationEmailDoctorController {
  GetData getData = GetData(Get.find());
  GetStorageControllerImp getStorage = Get.find();
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  late DoctorResponse doctorResponse;

  @override
  void onInit() {
    //
    super.onInit();
    doctorResponse = Get.arguments['user'];
  }

  @override
  verificationEmail(otp) async {
    statusRequest.value = StatusRequest.loading;
    var response = await getData.postData(
        'doctor/email-verification',
        {'email': doctorResponse.doctor.email, 'otp': otp},
        {'Authorization': 'Bearer ${doctorResponse.token}'});
    statusRequest.value = handlingData(response);

    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRouteDoctor.doctorConsulationsScreen);
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Email Or P1assword Not Correct");
        statusRequest.value = StatusRequest.failure;
      }
    } else {
      showDialogDoctor('title', response['message']);
    }
  }

  @override
  sendEmailVerification() async {
    statusRequest.value = StatusRequest.loading;
    var response = await getData.getData(
        'doctor/email-verification',
        {'email': doctorResponse.doctor.email},
        {'Authorization': 'Bearer ${doctorResponse.token}'});
    statusRequest.value = handlingData(response);

    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        showDialogDoctor('Verification Code', 'Verification Code is resend');
      }
    }
  }
}
