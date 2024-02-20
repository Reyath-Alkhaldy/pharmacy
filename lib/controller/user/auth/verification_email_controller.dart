import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/data/models/user.dart';
import '../../../core/utils/constant/export_constant.dart';

abstract class VerificationEmailController extends GetxController {
  goToMobileLayoutScreen();
  verificationEmail(otp);
  sendEmailVerification();
}

class VerificationEmailControllerImp extends VerificationEmailController {
  GetData getData = GetData(Get.find());
  GetStorageControllerImp getStorage = Get.find();
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  late UserResponse userResponse;

  @override
  void onInit() {
    super.onInit();
    userResponse = Get.arguments['user'];
  }

  @override
  verificationEmail(otp) async {
    statusRequest.value = StatusRequest.loading;
    var response = await getData.postData(
        'email-verification',
        {'email': userResponse.user.email, 'otp': otp},
        {'Authorization': 'Bearer ${userResponse.token}'});
    statusRequest.value = handlingData(response);

    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        goToMobileLayoutScreen();
        // Get.reloadAll();
        // Get.reset();
      } else {
        statusRequest.value = StatusRequest.success;
        Get.defaultDialog(
            title: "ُWarning", middleText: "Email Or P1assword Not Correct");
        await showDialogg('title', response['message']);
      }
    }
    if (response['message'] == 'Unauthenticated.') {
      await showDialogg('message', response['message']);
    } else if (statusRequest.value == StatusRequest.serverfailure) {
      statusRequest.value = StatusRequest.success;
      await showDialogDoctor('خطأ', 'هناك خطأ في السيرفر');
    }
  }

  @override
  sendEmailVerification() async {
    statusRequest.value = StatusRequest.loading;
    var response = await getData.getData(
        'email-verification',
        {'email': userResponse.user.email},
        {'Authorization': 'Bearer ${userResponse.token}'});
    statusRequest.value = handlingData(response);

    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        showDialogg('Verification Code', 'Verification Code is resend');
      }
    }
  }

  @override
  goToMobileLayoutScreen() {
    Get.offNamed(AppRoute.mobileLayoutScreen);
  }
}
