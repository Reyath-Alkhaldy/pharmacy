import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/category_medicine_controller.dart';
import 'package:new_maps/controller/medicines_controller.dart';
import 'package:new_maps/core/class/crud.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/data/database/remote/pharmacy_data.dart';
import 'package:new_maps/data/models/pharmacy.dart';

abstract class PharmacyController extends GetxController {
  getPharmacies();
  goToMedicinesScreen(Pharmacy pharmacy);
}

class PharmacyControllerImp extends PharmacyController {
  PharmacyData pharmacyData = PharmacyData(Get.find<Crud>());
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final pharmacies = <Pharmacy>[].obs;
  late CategoryMedicineControllerImp mainCategoryControllerImp;
  @override
  void onInit() {
    super.onInit();
    getPharmacies();
    if (kDebugMode) {
      print('response. init');
    }
  }

  @override
  getPharmacies() async {
    try {
      statusRequest.value = StatusRequest.loading;
      final response = await pharmacyData.getPharmacies("pharmacies", {});
      if (kDebugMode) {
        print(response);
        print('response.data');
      }
      statusRequest.value = handlingData(response);
      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          pharmacies.value = List<Pharmacy>.from(
            (response['data']).map<Pharmacy>(
              (x) => Pharmacy.fromMap(x as Map<String, dynamic>),
            ),
          );
          update();
        } else {
          statusRequest.value == StatusRequest.failure;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("هناك خطأ  ");
      }
      e.printError();
    }
  }

  @override
  goToMedicinesScreen(Pharmacy pharmacy)  {
    mainCategoryControllerImp =
        Get.put(CategoryMedicineControllerImp(), permanent: true);
        // mainCategoryControllerImp.getCategories(p)
     mainCategoryControllerImp.getMainCategoryScreen(pharmacy);
    Get.toNamed(
      AppRoute.medicinesScreen,
    );
  }
}
