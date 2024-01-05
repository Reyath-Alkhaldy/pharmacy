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
  Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final mainCategories = <MainCategory>[].obs;

  @override
  void onInit() {
    super.onInit();
    update();
    getCategories();
  }

  @override
  getCategories() async {
    try {
      statusRequest.value = StatusRequest.loading;
      final response = await categoryData.getCategories("main-categories", {});
      statusRequest.value = handlingData(response);
      if (statusRequest.value == StatusRequest.success) {
        if (response['status'] == 'success') {
          mainCategories.value = List<MainCategory>.from(
            (response['data']).map<MainCategory>(
              (x) => MainCategory.fromMap(x as Map<String, dynamic>),
            ),
          );
        } else {
          statusRequest.value = StatusRequest.failure;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("هناك خطأ في بيانات الأصناف ");
      }
      e.printError();
    }
  }

  @override
  getMainCategoryScreen(Pharmacy pharmacy) {
    update();
  }
}
