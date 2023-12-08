import 'package:get/get.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/data/models/medicine.dart';

abstract class MedicineDetailsController extends GetxController {
  goBack();
  goToCart();
  goToSignIn();

}

class MedicineDetailsControllerImp extends MedicineDetailsController {
  late Medicine medicine;
  @override
  void onInit() {
    medicine = Get.arguments['medicine'];
    super.onInit();
  }

  @override
  goBack() {
    Get.back();
  }

  @override
  goToCart() {
    throw UnimplementedError();
  }
   @override
  goToSignIn() {
    Get.toNamed(AppRoute.login);
  }
}
