import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/controller/search/search_controller.dart';
import 'package:new_maps/controller/user/pharmacies/categories_pharmacy_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/models/medicine.dart';
import 'package:new_maps/data/models/user.dart';

abstract class MedicinesPharmacyController extends SearchControllerClass {
  goToMedicineDetails(Medicine medicine);
  getMedicines();
}

class MedicinesPharmacyControllerImp extends MedicinesPharmacyController {
  RxBool selected = false.obs;
  final CategoriesPharmacyControllerImp categoriesPharmacyControllerImp =
      Get.find<CategoriesPharmacyControllerImp>();
  // late MedicineDetailsControllerImp medicineDetailsControllerImp;
  final medicines = <Medicine>[].obs;
  MedicinePagination? _medicinePagination;
  final searchMedicines = <Medicine>[].obs;
  MedicinePagination? _searchMedicinePagination;
  int? subCategoryID;
  int? pharmacyId;
  UserResponse? userResponse;
  GetStorageControllerImp getStorage = Get.find<GetStorageControllerImp>();

// ! Authorization Bearer
  get authorizationToken => {'Authorization': 'Bearer ${userResponse!.token}'};

  @override
  void onInit() {
    super.onInit();
// ! Authorization Bearer
    userResponse = getStorage.getUserResponse('user');
    getMedicines(
        subCategoryID: categoriesPharmacyControllerImp
            // ignore: invalid_use_of_protected_member
            .mainCategories
            .value[0]
            .subCategories![0]
            .id,
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

      statusRequest.value = StatusRequest.loading;
      final response = await getData.getData(
          "medicines",
          {'pharmacy_id': pharmacyId, 'sub_category_id': subCategoryID},
          userResponse != null ? authorizationToken : {});
      statusRequest.value = handlingData(response);
      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          MedicinePagination medicinesResponse = MedicinePagination.fromMap(
              response['data'] as Map<String, dynamic>);
          if (_medicinePagination != medicinesResponse) {
            _medicinePagination = medicinesResponse;
            medicines.value = medicinesResponse.medicines;
          }
        } else {
          statusRequest.value = StatusRequest.success;
          await showDialogg('title', response['message']);
        }
      }
      if (response['message'] == 'Unauthenticated.') {
        await showDialogg('message', response['message']);
      } else if (response['errors'].toString().isNotEmpty) {
        statusRequest.value = StatusRequest.success;
      }
    }
  }

  @override
  Future<void> search(String url,
      [Map? mapDataQuery,
      Map<String, dynamic>? headers,
      String? keyOfResponse]) async {
    await super.search(url, mapDataQuery, headers);
    _searchMedicinePagination =
        MedicinePagination.fromMap(data as Map<String, dynamic>);
    searchMedicines.clear();
    searchMedicines.addAll(_searchMedicinePagination!.medicines);
  }
}
