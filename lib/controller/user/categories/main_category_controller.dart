import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/data/database/remote/category_data.dart';
import 'package:new_maps/data/models/main_category.dart';
import 'package:new_maps/data/models/pharmacy.dart';

abstract class MainCategoryController extends GetxController {
  getCategories();
  getMainCategoryScreen(Doctor pharmacy);
  getMainCtgrySelected(int mainId, int subId);
  getSubCtgrySelected(int subId);
}

class MainCategoryControllerImp extends MainCategoryController {
  CategoryData categoryData = CategoryData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  final mainCategories = <MainCategory>[].obs;
  MainCategoryResponse? _mainCategoryResponse;
  final Rx<int> mainCtgryIsSelected = 0.obs;
  final Rx<int> subCtgryIsSelected = 0.obs;

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
            // this function set tabs selected or unselected
            getMainCtgrySelected(mainCategoryResponse.mainCategories[0].id,
                mainCategoryResponse.mainCategories[0].subCategories![0].id);
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
  getMainCategoryScreen(Doctor pharmacy) {
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
}
