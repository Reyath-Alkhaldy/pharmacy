import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/pharmacies/medicines_pharmacy_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/database/remote/category_data.dart';
import 'package:new_maps/data/models/main_category.dart';
import 'package:new_maps/data/models/pharmacy.dart';

abstract class CategoriesPharmacyController extends GetxController {
  getCategories(int pharmacyId);
  getMainCategoryScreen(Doctor pharmacy);
  getMainCtgrySelected(int mainId, int subId);
  getSubCtgrySelected(int subId);
  goToAaddRecipe();
}

class CategoriesPharmacyControllerImp extends CategoriesPharmacyController {
  CategoryData categoryData = CategoryData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  final mainCategories = <MainCategory>[].obs;
  final RxBool isNavegateFromPharmacyScreen = false.obs;
  Doctor? pharmacy;
  late MedicinesPharmacyControllerImp medicinesControllerImp;
  final Rx<int> mainCtgryIsSelected = 0.obs;
  final Rx<int> subCtgryIsSelected = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pharmacy = Get.arguments['pharmacy'];
    print("pharmacy is :${pharmacy!.id}");
    getCategories(pharmacy!.id);
  }

  @override
  getCategories(int pharmacyId) async {
    try {
      statusRequest = StatusRequest.loading;
      final response = await categoryData.getCategories("main-categories", {
        'pharmacy_id': pharmacyId,
      });
      print("categories is :${response['data']}");

      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          mainCategories.value = List<MainCategory>.from(
            (response['mainCategories']).map<MainCategory>(
              (x) => MainCategory.fromMap(x as Map<String, dynamic>),
            ),
          );
          getMainCtgrySelected(mainCategories.value[0].id,
              mainCategories.value[0].subCategories![0].id);
          update();
        } else {
          statusRequest = StatusRequest.failure;
          update();
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("هناك خطأ في بيانات الأصناف ");
      }
      e.printError();
      statusRequest = StatusRequest.serverfailure;
    }
  }

  @override
  getMainCategoryScreen(Doctor pharmacy) {
    this.pharmacy = pharmacy;
    medicinesControllerImp = Get.put(MedicinesPharmacyControllerImp());
    getCategories(pharmacy.id);

    update();
  }

  @override
  getMainCtgrySelected(int mainId, int subId) {
    mainCtgryIsSelected.value = mainId;
    subCtgryIsSelected.value = subId;
  }

  @override
  getSubCtgrySelected(int subId) {
    subCtgryIsSelected.value = subId;
  }

  @override
  goToAaddRecipe() {
    Get.toNamed(AppRoute.resipeScreen);
  }
}