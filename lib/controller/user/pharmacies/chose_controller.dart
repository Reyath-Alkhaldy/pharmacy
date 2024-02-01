import 'package:get/get.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/data/models/pharmacy_pagination.dart';

abstract class ChoseController extends GetxController {
  goToMedicinesCategoriesPharmacyScreenScreen();
  goToAaddRecipe();
  getToCartScreen();
}

class ChoseControllerImp extends ChoseController {
  GetData getData = GetData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  final RxBool isNavegateFromPharmacyScreen = false.obs;
  late Pharmacy pharmacy;
  late String name;

  @override
  void onInit() {
    super.onInit();
    pharmacy = Get.arguments['pharmacy'];
    name = pharmacy.name;
    update();
  }

  @override
  goToMedicinesCategoriesPharmacyScreenScreen() {
    Get.toNamed(AppRoute.medicinesCategoriesPharmacyScreen,
        arguments: {'pharmacy': pharmacy});
  }

  @override
  goToAaddRecipe() {
    Get.toNamed(AppRoute.resipeScreen);
  }

  @override
  getToCartScreen() {
    Get.toNamed(AppRoute.cart, arguments: {'pharmacy': pharmacy});
  }
}
