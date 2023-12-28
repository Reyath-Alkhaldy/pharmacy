import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_maps/core/class/dio_client.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/core/functions/check_internet_connection.dart';
import 'package:new_maps/data/models/pharmacy.dart';

abstract class PharmacyController extends GetxController {
  getPharmacies();
}

class PharmacyControllerImp extends PharmacyController {
  DioClient? dio;
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final pharmacies = <Pharmacy>[].obs;
  // Rx<Future<List<Pharmacy>>> pharmacies = Future.value(<Pharmacy>[]).obs;

  @override
  void onInit() {
    super.onInit();
    dio = DioClient();
    getPharmacies();
    print('response. init');
  }

  @override
  getPharmacies() async {
    try {
      if (checkInternetConnection()) {
        statusRequest.value = StatusRequest.loading;
        final response = await dio!.instance.get(
          "pharmacies",
        );
        if (kDebugMode) {
          print(response.data);
          print('response.data');
        }
        statusRequest.value = handlingData(response);
        if (statusRequest.value == StatusRequest.success) {
          pharmacies.value = List<Pharmacy>.from(
            (response.data).map<Pharmacy>(
              (x) => Pharmacy.fromMap(x as Map<String, dynamic>),
            ),
          );
        }

        if (kDebugMode) {
          // print(pharmacies[1]);
        }
      } else {
        statusRequest.value = StatusRequest.offlinefailure;
      }
    } catch (e) {
      if (kDebugMode) {
        print("هناك خطأ  ");
      }
      e.printError();
    } finally {
      statusRequest.value = StatusRequest.success;
    }

    // return pharmacies;
  }
}
