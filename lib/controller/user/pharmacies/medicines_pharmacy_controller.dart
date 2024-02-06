import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/pharmacies/categories_pharmacy_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/database/remote/medicine_data.dart';
import 'package:new_maps/data/models/medicine.dart';

abstract class MedicinesPharmacyController extends GetxController {
  goToMedicineDetails(Medicine medicine);
  getMedicines();
}

class MedicinesPharmacyControllerImp extends MedicinesPharmacyController {
  RxBool selected = false.obs;
  final medicines = <Medicine>[].obs;
  StatusRequest statusRequest = StatusRequest.none;
  MedicineData medicineData = MedicineData(crud: Get.find());
  late CategoriesPharmacyControllerImp categoriesPharmacyControllerImp;
  // late MedicineDetailsControllerImp medicineDetailsControllerImp;
  MedicinesResponse? _medicinesResponse;
  int? subCategoryID;
  int? pharmacyId;

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
    if (this.subCategoryID != subCategoryID || this.pharmacyId != pharmacyId) {
      this.subCategoryID = subCategoryID;
      this.pharmacyId = pharmacyId;
      try {
        statusRequest = StatusRequest.loading;
        final response = await medicineData.getMedicines("medicines", {
          'pharmacy_id': pharmacyId,
          'sub_category_id': subCategoryID,
        });
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          MedicinesResponse medicinesResponse =
              MedicinesResponse.fromMap(response as Map<String, dynamic>);
          if (_medicinesResponse != medicinesResponse) {
            _medicinesResponse = medicinesResponse;
            medicines.value = medicinesResponse.medicines;
            update();
          }
        }
         else if (response['errors'].toString().isNotEmpty) {
        statusRequest = StatusRequest.success;
        showDialogg('title', response['message']);

      } else {
         statusRequest == StatusRequest.failure;
          update();
        showDialogg('title', response['message']);        
      }
         
      } catch (e) {
        if (kDebugMode) {
          print("هناك خطأ في جلب بيانات الأدوية");
        }
        e.printError();
        statusRequest = StatusRequest.serverfailure;
      }
    }
  }
}
