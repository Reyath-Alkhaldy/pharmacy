import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/data/database/remote/medicine_data.dart';
import 'package:new_maps/data/models/medicine.dart';
import '../medicine_details_controller.dart';
import 'main_category_controller.dart';

abstract class MedicinesCategoryController extends GetxController {
  goToMedicineDetails(Medicine medicine);
  getMedicines();
}

class MedicinesCategoryControllerImp extends MedicinesCategoryController {
  RxBool selected = false.obs;
  final medicines = <Medicine>[].obs;
  StatusRequest statusRequest = StatusRequest.none;
  MedicineData medicineData = MedicineData(crud: Get.find());
  late MainCategoryControllerImp mainCategoryControllerImp;
  late MedicineDetailsControllerImp medicineDetailsControllerImp;
  late MedicineDetailsController medicineDetailsController;
  MedicinesResponse? _medicinesResponse;
  int? subCategoryID;
  @override
  void onInit() {
    super.onInit();
    mainCategoryControllerImp = Get.find<MainCategoryControllerImp>();
    if (kDebugMode) {
      print(
          'iiiiiiiiiiiiiiii init${mainCategoryControllerImp.mainCategories.value[0]}');
    }
    getMedicines(
      subCategoryID: mainCategoryControllerImp
          .mainCategories.value[0].subCategories![0].id,
    );
  }

  @override
  getMedicines({int? subCategoryID}) async {
    if (kDebugMode) {
      print(" subCategoryID = $subCategoryID ");
    }
    if (this.subCategoryID != subCategoryID) {
      this.subCategoryID = subCategoryID;
      try {
        print('iiiiiiiiiiiiiiii init medicines');
        statusRequest = StatusRequest.loading;
        final response = await medicineData.getMedicines("medicines", {
          'sub_category_id': subCategoryID,
        });

        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == 'success') {
            MedicinesResponse medicinesResponse =
                MedicinesResponse.fromMap(response as Map<String, dynamic>);
            if (_medicinesResponse != medicinesResponse) {
              _medicinesResponse = medicinesResponse;
              medicines.value = medicinesResponse.medicines;
              // print(medicines.value[0]);
              update();
            }
          } else {
            statusRequest == StatusRequest.failure;
            update();
          }
        }
      } catch (e) {
        if (kDebugMode) {
          update();
          print("هناك خطأ في جلب بيانات الأدوية");
        }
        e.printError();
      }
    }
  }

  @override
  goToMedicineDetails(Medicine medicine) {
    Get.toNamed(AppRoute.medicineDetails, arguments: {
      'medicine': medicine,
    });
  }
}
