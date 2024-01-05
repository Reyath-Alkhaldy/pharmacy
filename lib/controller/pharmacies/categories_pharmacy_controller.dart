import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/pharmacies/medicines_pharmacy_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/data/database/remote/category_data.dart';
import 'package:new_maps/data/models/main_category.dart';
import 'package:new_maps/data/models/pharmacy.dart';

abstract class CategoriesPharmacyController extends GetxController {
  getCategories(int pharmacyId);
  getMainCategoryScreen(Pharmacy pharmacy);
}

class CategoriesPharmacyControllerImp extends CategoriesPharmacyController {
  CategoryData categoryData = CategoryData(Get.find());
  Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final mainCategories = <MainCategory>[].obs;
  final RxBool isNavegateFromPharmacyScreen = false.obs;
  Pharmacy? pharmacy;
  late MedicinesControllerImp medicinesControllerImp;
  // CategoryMedicineControllerImp(){}

  @override
  void onInit() {
    super.onInit();
    pharmacy = Get.arguments['pharmacy'];
    print("pharmacy is :${pharmacy!.id}");
    getCategories(pharmacy!.id);
    update();
  }

  @override
  getCategories(int pharmacyId) async {
    try {
      statusRequest.value = StatusRequest.loading;
      final response = await categoryData.getCategories("main-categories", {
        'pharmacy_id': pharmacyId,
      });
    print("categories is :${response['data']}");

      statusRequest.value = handlingData(response);
      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          mainCategories.value = List<MainCategory>.from(
            (response['mainCategories']).map<MainCategory>(
              (x) => MainCategory.fromMap(x as Map<String, dynamic>),
            ),
          );
    print("categories is :${mainCategories.value.first}");

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
  getMainCategoryScreen(Pharmacy pharmacy) {
    this.pharmacy = pharmacy;
    medicinesControllerImp = Get.put(MedicinesControllerImp());
    getCategories(pharmacy.id);

    update();
  }
}
