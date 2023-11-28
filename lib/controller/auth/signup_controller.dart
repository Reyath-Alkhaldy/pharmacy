import 'package:get/get.dart';
import 'package:new_maps/core/constant/routes.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToLogin();
  goToPharmacyScreen();
}

class SignUpControllerImp extends SignUpController {
  @override
  signUp() {
    // TODO: implement signUp
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