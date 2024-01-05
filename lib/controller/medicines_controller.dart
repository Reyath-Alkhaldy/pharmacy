import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/categories_pharmacy_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/data/database/remote/medicine_data.dart';
import 'package:new_maps/data/models/medicine.dart';

import 'medicine_details_controller.dart';

abstract class MedicinesController extends GetxController {
  goToMedicineDetails(Medicine medicine);
  setSelected(bool selected);
  getMedicines();
}

class MedicinesControllerImp extends MedicinesController {
  RxBool selected = false.obs;
  final medicines = <Medicine>[].obs;
  Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  MedicineData medicineData = MedicineData(crud: Get.find());
  late CategoriesPharmacyControllerImp categoriesPharmacyControllerImp;
  late MedicineDetailsControllerImp medicineDetailsControllerImp;

  @override
  void onInit() {
    super.onInit();
    categoriesPharmacyControllerImp =
        Get.find<CategoriesPharmacyControllerImp>();
    if (kDebugMode) {
      print(
          'iiiiiiiiiiiiiiii init${categoriesPharmacyControllerImp.mainCategories}');
    }
    getMedicines(
        subCategoryID: categoriesPharmacyControllerImp
            .mainCategories.value[0].subCategories![0].id,
        pharmacyId: categoriesPharmacyControllerImp.pharmacy!.id);
    update();
  }

  @override
  goToMedicineDetails(Medicine medicine) {
    Get.toNamed(AppRoute.medicineDetails, arguments: {
      'medicine': medicine,
    });
  }

  @override
  getMedicines({int? pharmacyId, int? subCategoryID}) async {
    if (kDebugMode) {
      print("pharmacyId = $pharmacyId subCategoryID = $subCategoryID ");
    }
    try {
      print('iiiiiiiiiiiiiiii init medicines');
      statusRequest.value = StatusRequest.loading;
      final response = await medicineData.getMedicines("medicines", {
        'pharmacy_id': pharmacyId,
        'sub_category_id': subCategoryID,
      });
      statusRequest.value = handlingData(response);
      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          medicines.value = List<Medicine>.from(
            (response['data']).map<Medicine>(
              (x) => Medicine.fromMap(x as Map<String, dynamic>),
            ),
          );
        } else {
          statusRequest.value == StatusRequest.failure;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("هناك خطأ في جلب بيانات الأدوية");
      }
      e.printError();
    }
  }

  @override
  setSelected(bool selected) {
    this.selected.value = selected;
  }
}
