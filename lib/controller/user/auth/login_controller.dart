import 'package:get/get.dart';
import 'package:new_maps/core/utils/constant/routes.dart';

abstract class LoginController extends GetxController {
  goToSignUp();
  goToPharmacyScreen();
}

class LoginControllerImp extends LoginController {
  

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }
  
  @override
  goToPharmacyScreen() {
    Get.offNamed(AppRoute.pharmacy);
  }
}
