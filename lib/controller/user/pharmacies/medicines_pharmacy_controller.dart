import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  getMoreMedicines();
}

class MedicinesPharmacyControllerImp extends MedicinesPharmacyController {
  // RxBool selected = false.obs;
  final CategoriesPharmacyControllerImp categoriesPharmacyControllerImp =
      Get.find<CategoriesPharmacyControllerImp>();
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
  int page = 0;

  ScrollController scrollController = ScrollController();
  void paginateState() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        if (page < _medicinePagination!.lastPage) {
          page++;
          getMoreMedicines();
        }
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    paginateState();
  }

  @override
  void onInit() {
    super.onInit();
// ! Authorization Bearer
    userResponse = getStorage.getUserResponse('user');
    getMedicines(
        subCategoryID: categoriesPharmacyControllerImp
            // ignore: invalid_use_of_protected_member
            .mainCategories[0]
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
          "medicines?page=$page",
          {'pharmacy_id': pharmacyId, 'sub_category_id': subCategoryID},
          userResponse != null ? authorizationToken : {});
      statusRequest.value = handlingData(response);
      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          MedicinePagination medicinesPagination = MedicinePagination.fromMap(
              response['data'] as Map<String, dynamic>);
          if (_medicinePagination != medicinesPagination) {
            _medicinePagination = medicinesPagination;
            medicines.value = medicinesPagination.medicines;
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
  getMoreMedicines() async {
    if (kDebugMode) {
      print("pharmacyId = $pharmacyId subCategoryID = $subCategoryID ");
    }
    anotherStatusRequest.value = StatusRequest.loading;
    final response = await getData.getData(
        "medicines?page=$page",
        {'pharmacy_id': pharmacyId, 'sub_category_id': subCategoryID},
        userResponse != null ? authorizationToken : {});
    anotherStatusRequest.value = handlingData(response);
    if (anotherStatusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        MedicinePagination medicinesPagination = MedicinePagination.fromMap(
            response['data'] as Map<String, dynamic>);
        if (_medicinePagination != medicinesPagination) {
          _medicinePagination = medicinesPagination;
          medicines.addAll(medicinesPagination.medicines);
        }
      } else {
        anotherStatusRequest.value = StatusRequest.success;
        await showDialogg('title', response['message']);
      }
    }
    if (response['message'] == 'Unauthenticated.') {
      await showDialogg('message', response['message']);
    } else if (response['errors'].toString().isNotEmpty) {
      anotherStatusRequest.value = StatusRequest.success;
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
