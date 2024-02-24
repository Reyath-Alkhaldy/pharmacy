import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_maps/controller/user/pharmacies/medicines_pharmacy_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/utils/constant/export_constant.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/data/models/main_category.dart';
import 'package:new_maps/data/models/pharmacy_pagination.dart';

abstract class CategoriesPharmacyController extends GetxController {
  getCategories(int pharmacyId);
  getMainCategoryScreen(Pharmacy pharmacy);
  getMainCtgrySelected(int mainId, int subId);
  getSubCtgrySelected(int subId);
  goToAaddRecipe();
  getToCartScreen();
}

class CategoriesPharmacyControllerImp extends CategoriesPharmacyController {
  GetData categoryData = GetData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  final mainCategories = <MainCategory>[].obs;
  Pharmacy? pharmacy;
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
      final response = await categoryData.getData("main-categories", {
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
        }  else if (response['errors'].toString().isNotEmpty) {
        statusRequest = StatusRequest.success;
        showDialogg('title', response['message']);

      } else {
         statusRequest = StatusRequest.failure;
          update();
        showDialogg('title', response['message']);        
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
  getMainCategoryScreen(Pharmacy pharmacy) {
    this.pharmacy = pharmacy;
    medicinesControllerImp = Get.put(MedicinesPharmacyControllerImp());
    getCategories(pharmacy.id);

    update();
  }

  @override
  getToCartScreen() {
    Get.toNamed(AppRoute.cart, arguments: {'pharmacy': pharmacy});
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
