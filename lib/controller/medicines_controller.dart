import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/main_category_controller.dart';
import 'package:new_maps/core/utils/constant/routes.dart';
import 'package:new_maps/data/models/medicine.dart';

import '../core/class/dio_client.dart';

abstract class MedicinesController extends GetxController {
  goToMedicineDetails(Medicine medicine);
  setSelected(bool selected);
  getMedicines();
}

class MedicinesControllerImp extends MedicinesController {
  RxBool selected = false.obs;
  late DioClient dio;
  final isLoading = true.obs;
  final medicines = <Medicine>[].obs;
  // MedicinesControllerImp({int? pharmacyId, int? subCategoryID}) {
  //   print('iiiiiiiiiiiiiiii constructor');
  //   dio = DioClient();
  //   getMedicines(pharmacyId: pharmacyId, subCategoryID: subCategoryID);
  // }
  @override
  void onInit() {
    super.onInit();
    print('iiiiiiiiiiiiiiii init');
    MainCategoryControllerImp mainCategoriesController = Get.find();

    dio = DioClient();
    getMedicines(
        subCategoryID:
            mainCategoriesController.mainCategories[0].subCategories![0].id);
  }

  @override
  goToMedicineDetails(Medicine medicine) {
    Get.toNamed(AppRoute.medicineDetails, arguments: {
      'medicine': medicine,
    });
  }

  @override
  getMedicines({int? pharmacyId, int? subCategoryID}) async {
    print("pharmacyId = $pharmacyId subCategoryID = $subCategoryID ");
    try {
      isLoading(true);
      final response = await dio.instance.get("medicines", queryParameters: {
        'pharmacy_id': pharmacyId,
        'sub_category_id': subCategoryID,
      });
      medicines.value = List<Medicine>.from(
        (response.data).map<Medicine>(
          (x) => Medicine.fromMap(x as Map<String, dynamic>),
        ),
      );
      if (kDebugMode) {
        // print(medicines[1]);
      }
    } catch (e) {
      if (kDebugMode) {
        print("هناك خطأ في جلب بيانات الأدوية");
      }
      e.printError();
    } finally {
      isLoading(false);
    }
  }

  @override
  setSelected(bool selected) {
    this.selected.value = selected;
    // update();
  }
}
