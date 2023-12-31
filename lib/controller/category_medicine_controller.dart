import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/medicines_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/data/database/remote/category_data.dart';
import 'package:new_maps/data/models/main_category.dart';
import 'package:new_maps/data/models/pharmacy.dart';

abstract class CategoryMedicineController extends GetxController {
  getCategories(int pharmacyId);
  getMainCategoryScreen(Pharmacy pharmacy);
}

class CategoryMedicineControllerImp extends CategoryMedicineController {
  CategoryData categoryData = CategoryData(Get.find());
  Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final mainCategories = <MainCategory>[].obs;
  final RxBool isNavegateFromPharmacyScreen = false.obs;
  Pharmacy? pharmacy;
  late MedicinesControllerImp medicinesControllerImp;
  CategoryMedicineControllerImp(){}

  @override
  void onInit() {
    super.onInit();
    // pharmacy = Get.arguments['pharmacy'];
    update();
    getCategories(1);
  }

  @override
  getCategories(int pharmacyId) async {
    try {
      statusRequest.value = StatusRequest.loading;
      final response = await categoryData.getCategories("main-categories", {
        'pharmacy_id': pharmacyId,
      });
      statusRequest.value = handlingData(response);
      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          mainCategories.value = List<MainCategory>.from(
            (response['data']).map<MainCategory>(
              (x) => MainCategory.fromMap(x as Map<String, dynamic>),
            ),
          );
        } else {
          statusRequest.value = StatusRequest.failure;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("هناك خطأ في بيانات الأصناف ");
      }
      e.printError();
    }
  }

  @override
  getMainCategoryScreen(Pharmacy pharmacy)  {
    this.pharmacy = pharmacy;
    medicinesControllerImp = Get.put(MedicinesControllerImp() );
    getCategories(pharmacy.id);

  //  await medicinesControllerImp.getMedicines(pharmacyId: pharmacy.id, );
    update();
  }
}
