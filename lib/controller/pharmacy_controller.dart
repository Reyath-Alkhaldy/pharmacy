import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/class/dio_client.dart';
import 'package:new_maps/core/utils/constant/string.dart';
import 'package:new_maps/data/models/pharmacy.dart';

abstract class PharmacyController extends GetxController {
  getPharmacies();
}

class PharmacyControllerImp extends PharmacyController {
  late DioClient dio;
  final isLoading = true.obs;
  final pharmacies = <Pharmacy>[].obs;
  // Rx<Future<List<Pharmacy>>> pharmacies = Future.value(<Pharmacy>[]).obs;

  @override
  void onInit() {
    super.onInit();
    dio = DioClient();
    getPharmacies();
  }

  @override
  getPharmacies() async {
    try {
      isLoading(true);
      final response = await dio.instance.get(
        "pharmacies",
      );
      pharmacies.value = List<Pharmacy>.from(
        (response.data).map<Pharmacy>(
          (x) => Pharmacy.fromMap(x as Map<String, dynamic>),
        ),
      );
      if (kDebugMode) {
        // print(pharmacies[1]);
      }
    } catch (e) {
      if (kDebugMode) {
        print("هناك خطأ  ");
      }
      e.printError();
    } finally {
      isLoading(false);
    }

    // return pharmacies;
  }
}
