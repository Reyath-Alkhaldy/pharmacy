import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/data/database/remote/category_data.dart';
import 'package:new_maps/data/models/main_category.dart';
import 'package:new_maps/data/models/pharmacy.dart';

abstract class MainCategoryController extends GetxController {
  getCategories();
  getMainCategoryScreen(Pharmacy pharmacy);
}

class MainCategoryControllerImp extends MainCategoryController {
  CategoryData categoryData = CategoryData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  final mainCategories = <MainCategory>[].obs;
  MainCategoryResponse? _mainCategoryResponse;

  @override
  void onInit() {
    super.onInit();
    getCategories();
  }

  @override
  getCategories() async {
    try {
      statusRequest = StatusRequest.loading;
      final response = await categoryData.getCategories("main-categories", {});
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          MainCategoryResponse mainCategoryResponse =
              MainCategoryResponse.fromMap(response);
          if (_mainCategoryResponse != mainCategoryResponse) {
            mainCategories.value = mainCategoryResponse.mainCategories;
            update();
          }
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
      update();
    }
  }

  @override
  getMainCategoryScreen(Pharmacy pharmacy) {
    update();
  }
}
