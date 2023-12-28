import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/class/dio_client.dart';
import 'package:new_maps/data/models/main_category.dart';
import 'package:new_maps/data/models/pharmacy.dart';

abstract class MainCategoryController extends GetxController {
  getCategories();
}

class MainCategoryControllerImp extends MainCategoryController {
  late DioClient dio;
  final isLoading = true.obs;
  final mainCategories = <MainCategory>[].obs;
  final RxBool isNavegateFromPharmacyScreen = false.obs;
  late Pharmacy? pharmacy;

  @override
  void onInit() {
    super.onInit();
    dio = DioClient();
    pharmacy = Get.arguments != null  
        ? Get.arguments['pharmacy'] as Pharmacy
        : null;
    getCategories();
  }

  @override
  getCategories() async {
    try {
      isLoading(true);
      final response = await dio.instance.get(
        "main-categories",
      );
      // print(response.data);
      mainCategories.value = List<MainCategory>.from(
        (response.data).map<MainCategory>(
          (x) => MainCategory.fromMap(x as Map<String, dynamic>),
        ),
      );
      if (kDebugMode) {
        // print(mainCategories[1]);
      }
    } catch (e) {
      if (kDebugMode) {
        print("هناك خطأ  ");
      }
      e.printError();
    } finally {
      isLoading(false);
    }
  }
}
